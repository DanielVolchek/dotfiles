return {
	"nvimtools/none-ls.nvim",
	event = "LspAttach",
	dependencies = {
		"williamboman/mason.nvim",
		"jayp0521/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local setup, null_ls = pcall(require, "null-ls")
		if not setup then
			return
		end

		-- local eslint_d = require("none-ls.formatting.eslint")
		local eslint_d_diagnostics = require("none-ls.diagnostics.eslint_d")
		local eslint_d_formatting = require("none-ls.formatting.eslint_d")

		local M = {}

		M.diagnostic_timer = nil

		local function safe_call(fn, ...)
			local status, result = pcall(fn, ...)
			if not status then
				-- Optionally log the error silently
				-- vim.schedule(function() vim.api.nvim_out_write("Error: " .. tostring(result) .. "\n") end)
			end
			return status, result
		end

		vim.api.nvim_create_autocmd("InsertEnter", {
			callback = function()
				safe_call(function()
					if type(M.diagnostic_timer) == "number" then
						safe_call(vim.fn.timer_stop, M.diagnostic_timer)
						M.diagnostic_timer = nil
					end
					safe_call(vim.diagnostic.disable)
				end)
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				safe_call(function()
					if type(M.diagnostic_timer) == "number" then
						safe_call(vim.fn.timer_stop, M.diagnostic_timer)
					end
					M.diagnostic_timer = vim.defer_fn(function()
						safe_call(vim.diagnostic.enable)
						M.diagnostic_timer = nil
					end, 50)
				end)
			end,
		})

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- setup formatters & linters
			debug = true,
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				-- formatting.eslint_d, -- js/ts linter
				-- formatting.prettier, -- js/ts formatter
				-- formatting.prettierd,
				-- eslint_d, -- js/ts linter
				eslint_d_diagnostics, -- js/ts linter diagnoses
				eslint_d_formatting, -- js/ts linter formatting
				formatting.stylua, -- lua formatter
				-- formatting.rustfmt, -- rust formatter
				formatting.goimports, -- go formatter that also auto updates imports
				formatting.google_java_format,
				formatting.csharpier, -- c sharp formatter
				-- eslint_d was causing some issues but leaving it here to look back later
				-- eslint-lsp from mason seems to work just fine
				-- diagnostics.eslint_d, -- js/ts linter
				-- diagnostics.eslint, -- js/ts linter
			},
			update_in_insert = false,
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								timeout_ms = 5000,
							})
						end,
					})
				end
			end,
			-- you can reuse a shared lspconfig on_attach callback here
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
			-- 				vim.lsp.buf.formatting_sync({
			-- 					filter = function(currclient)
			-- 						return currclient.name == "null-ls"
			-- 					end,
			-- 				}, 5000)
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}

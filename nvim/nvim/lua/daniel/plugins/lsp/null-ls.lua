-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	debug = true,
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.eslint_d, -- js/ts linter
		formatting.clang_format, -- c/c++ linter
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		-- eslint_d was causing some issues but leaving it here to look back later
		-- eslint-lsp from mason seems to work just fine
		-- diagnostics.eslint_d, -- js/ts linter
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		print("null-ls attached")
		if current_client.supports_method("textDocument/formatting") then
			print("null-ls formatting attached")
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
					print("Formatting...")
				end,
			})
		end
	end,
})

return {
	{
		"folke/neodev.nvim",
		ft = { "lua" },
		config = function()
			require("neodev").setup({})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	"hrsh7th/cmp-nvim-lsp",
	"folke/which-key.nvim",
	"nvim-lua/lsp-status.nvim",
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		config = function()
			-- import lspconfig plugin safely
			local whichkey_status, which_key = pcall(require, "which-key")
			if not whichkey_status then
				vim.notify("which-key plugin is not installed", vim.log.levels.ERROR)
			end

			local lspconfig_status, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status then
				vim.notify("lspconfig plugin is not installed", vim.log.levels.ERROR)
				return
			end

			-- import cmp-nvim-lsp plugin safely
			local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if not cmp_nvim_lsp_status then
				vim.notify("cmp-nvim-lsp plugin is not installed", vim.log.levels.ERROR)
				return
			end

			local lsptatus_status, lsp_status = pcall(require, "lsp-status")
			if not lsptatus_status then
				vim.notify("lsp-status plugin is not installed", vim.log.levels.ERROR)
			end
			lsp_status.register_progress()

			-- import typescript plugin safely
			local typescript_status, typescript = pcall(require, "typescript-tools")

			if not typescript_status then
				vim.notify("typescript plugin is not installed", vim.log.levels.ERROR)
				return
			end

			-- filter out extra definition in react
			local function filter(arr, fn)
				if type(arr) ~= "table" then
					return arr
				end

				local filtered = {}
				for k, v in pairs(arr) do
					if fn(v, k, arr) then
						table.insert(filtered, v)
					end
				end

				return filtered
			end

			local function filterReactDTS(value)
				return string.match(value.filename, "react/index.d.ts") == nil
			end

			local function on_list(options)
				local items = options.items
				if #items > 1 then
					items = filter(items, filterReactDTS)
				end

				vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
				vim.api.nvim_command("cfirst") -- or maybe you want 'copen' instead of 'cfirst'
			end

			-- import neodev plugin safely
			local keymap = vim.keymap -- for conciseness

			-- enable keybinds only for when lsp server available
			local on_attach = function(client, bufnr)
				-- attach signature
				-- local sig_status, signature = pcall(require, "lsp_signature")
				-- if sig_status then
				-- 	signature.on_attach(sig_opts, bufnr)
				-- end
				-- keybind options
				local opts = { noremap = true, silent = true, buffer = bufnr }
				lsp_status.on_attach(client)

				keymap.set("n", "<leader>gD", function()
					vim.lsp.buf.definition({ on_list = on_list })
				end, opts) -- got to declaration

				-- set keybinds
				keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
				keymap.set("n", "<leader>gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
				keymap.set("n", "<leader>gD", function()
					vim.lsp.buf.definition({ on_list = on_list })
				end, opts) -- got to declaration
				keymap.set("n", "gD", function()
					vim.lsp.buf.definition({ on_list = on_list })
				end, opts) -- got to declaration
				keymap.set("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- got to declaration
				keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
				keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "<leader>d<CR>", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>d<CR>", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				keymap.set("n", "<leader>ee", "<cmd>LspStart emmet_ls<CR>", opts) -- start emmet lsp server
				keymap.set("n", "<leader>es", "<cmd>LspStop 6 (emmet_ls)<CR>", opts) -- start emmet lsp server

				--register new mappings in lsp
				local mappings = {
					["<leader>"] = {
						["rn"] = "Smart Rename",
						d = {
							name = "Diagnostics",
							d = "Show diagnostics",
						},
						k = "Show Documentation",
					},
					g = {
						name = "Go to",
						f = "Find Defs/Refs",
						d = "Open Definiton Popup",
						D = "Open Definiton Buffer",
						i = "Open Implementation Buffer",
					},
				}
				-- typescript specific keymaps (e.g. rename file and update imports)
				if client.name == "typescript-tools" then
					keymap.set("n", "<leader>rf", "<cmd>TSToolsRenameFile<CR>") -- rename file and update imports
					keymap.set("n", "<leader>ru", "<cmd>TSToolsRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
					keymap.set("n", "<leader>oi", "<cmd>TSToolsOrganizeImports<CR>") -- remove unused variables (not in youtube nvim video)
					table.insert(mappings["<leader>"], {
						r = {
							name = "TS Refactor",
							f = "Rename File",
							u = "Remove Unused",
						},
					})
				end

				if whichkey_status then
					which_key.register(mappings, { prefix = "" })
				end
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure typescript server with plugin
			typescript.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["eslint"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
				cmd = { "eslint_d", "--stdio" },
			})

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- -- configure emmet snippets
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				filetypes = { "html", "typescriptreact", "javascriptreact" },
				autostart = false,
				-- filetypes = { "html" },
			})

			-- configure astro server
			lspconfig["astro"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure go server
			lspconfig["gopls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure C++ server
			lspconfig["clangd"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure rust server
			lspconfig["rust_analyzer"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure python server
			lspconfig["pylsp"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["prismals"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- configure bash server
			lspconfig["bashls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "zshrc", "bashrc", "bash", "zsh", "sh" },
			})
		end,

		-- auto format eslint on save with lspconfig

		-- auto format on save
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
		-- 	command = "silent! EslintFixAll",
		-- 	group = vim.api.nvim_create_augroup("MyAutocmdsJavaScripFormatting", {}),
		-- })
	},
}

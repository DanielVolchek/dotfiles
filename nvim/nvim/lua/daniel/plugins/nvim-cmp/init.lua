return {
	-- import nvim-cmp plugin safely

	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	{
		"uga-rosa/cmp-dictionary",
		opts = {
			paths = { "~/dotfiles/en.dict" },
			first_case_insensitive = true,
			exact_length = 2,
		},
		config = true,
	},
	"onsails/lspkind.nvim",
	{
		"hrsh7th/nvim-cmp",
		event = "LspAttach",
		config = function()
			local cmp_status, cmp = pcall(require, "cmp")
			if not cmp_status then
				P("cmp status")
				return
			end

			-- import luasnip plugin safely
			local luasnip_status, luasnip = pcall(require, "luasnip")
			if not luasnip_status then
				P("luasnip")
				return
			end

			-- import lspkind plugin safely
			local lspkind_status, lspkind = pcall(require, "lspkind")
			if not lspkind_status then
				P("lspkind")
				return
			end

			local cmpdict_status, cmp_dict = pcall(require, "cmp_dictionary")
			if not cmpdict_status then
				P("cmpdict")
				return
			end

			-- load vs-code like snippets from plugins (e.g. friendly-snippets)
			require("luasnip/loaders/from_vscode").lazy_load()

			vim.opt.completeopt = "menu,menuone,noselect"

			-- helper function for super tab functionality (not in youtube nvim video)
			-- local has_words_before = function()
			-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			-- end

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
					["<TAB>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
					-- super tab functionality (not in youtube nvim video)
					-- ["<Tab>"] = cmp.mapping(function(fallback) -- use tab for next suggestion
					-- 	if cmp.visible() then
					-- 		cmp.select_next_item()
					-- 	elseif luasnip.expand_or_jumpable() then
					-- 		luasnip.expand_or_jump()
					-- 	elseif has_words_before() then
					-- 		cmp.complete()
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
					--
					-- ["<S-Tab>"] = cmp.mapping(function(fallback) -- use shift-tab for prev suggestion
					-- 	if cmp.visible() then
					-- 		cmp.select_prev_item()
					-- 	elseif luasnip.jumpable(-1) then
					-- 		luasnip.jump(-1)
					-- 	else
					-- 		fallback()
					-- 	end
					-- end, { "i", "s" }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					-- { name = "copilot" },
					{
						name = "nvim_lsp",
						priority = 10,
					}, -- lsp
					{
						name = "luasnip",
						priority = 0,
					}, -- snippets
					{
						name = "buffer",
						priority = 0,
					}, -- text within current buffer
					{
						name = "dictionary",
						keyword_length = 4,
						priority = 0,
					},
					{ name = "path" }, -- file system paths
				}),
				-- configure lspkind for vs-code like icon
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				sorting = {
					priority_weight = 2,
				},
			})
		end,
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"uga-rosa/cmp-dictionary",
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim",
		},
	},
}

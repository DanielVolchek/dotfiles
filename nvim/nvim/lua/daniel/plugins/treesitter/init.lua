return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				-- enable syntax highlighting
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				-- autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"comment",
					"json",
					"jsdoc",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"prisma",
					"rust",
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}

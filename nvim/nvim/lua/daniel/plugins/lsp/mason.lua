return {
	{
		"williamboman/mason.nvim",
		config = true,
		priority = 100,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"rust_analyzer",
				"jdtls",
				"pylsp",
				"gopls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			priority = 100,
		},
	},
	{
		"jayp0521/mason-null-ls.nvim",
		event = "LspAttach",
		opts = {
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"rustfmt", -- rust formatter
				"google_java_format", -- java formatter
			},
		},
		automatic_installation = true,
	},
}

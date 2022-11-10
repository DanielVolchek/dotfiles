_G.config = {}
config.user_terminals = {}

-- setup
require("daniel.plugins-setup")

--core
require("daniel.core.options") -- opts
require("daniel.core.keymaps") -- keymaps
require("daniel.core.colorscheme") -- colorscheme
require("daniel.core.commands") -- self-defined commands

--plugins

-- call notify first so that it can be used in other configs if needed
require("daniel.plugins.notify")
require("daniel.plugins.noice")

--lsp plugins
require("daniel.plugins.lsp.mason")
require("daniel.plugins.lsp.lspsaga")
require("daniel.plugins.lsp.lspconfig")
require("daniel.plugins.lsp.null-ls")
require("daniel.plugins.treesitter")

-- other plugins
require("daniel.plugins.comment")
require("daniel.plugins.nvim-tree")
require("daniel.plugins.lualine")
--todo add titles to pickers
require("daniel.plugins.telescope")
require("daniel.plugins.nvim-cmp")
require("daniel.plugins.autopairs")
require("daniel.plugins.gitsigns")
require("daniel.plugins.project")
require("daniel.plugins.toggleterm")
require("daniel.plugins.ccc")
require("daniel.plugins.marks")
require("daniel.plugins.which-key")
require("daniel.plugins.dashboard")
require("daniel.plugins.barbar")
require("daniel.plugins.symbols-outline")
require("daniel.plugins.betterescape")

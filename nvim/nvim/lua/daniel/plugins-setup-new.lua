-- auto install lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- add list of plugins to install
vim.g.mapleader = " "

require("lazy").setup({
	"ggandor/leap.nvim", -- leap plugin
	"willothy/flatten.nvim", -- flatten nvim file in terminal into nvim instance
	"mrjones2014/smart-splits.nvim", -- better split resiing
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
	"max397574/better-escape.nvim",
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	"uga-rosa/ccc.nvim", -- color picker
	"folke/neodev.nvim", -- neovim lua development tooling
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"nvim-lua/lsp-status.nvim", -- get lsp status
	"mfussenegger/nvim-jdtls", -- java language server support
	"folke/trouble.nvim", -- lsp diagnostics"
	"ray-x/lsp_signature.nvim", -- lsp signatures
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	"neovim/nvim-lspconfig", -- easily configure language servers
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"rafamadriz/friendly-snippets", -- useful snippets
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"L3MON4D3/LuaSnip", -- snippet engine
	"hrsh7th/cmp-path", -- source for file system paths
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/nvim-cmp", -- completion plugin
	"akinsho/toggleterm.nvim", -- toggleable terminal
	"folke/which-key.nvim", -- show keybindings
	"DanielVolchek/tailiscope.nvim", -- Telescope menu for TailwindCSS
	"nvim-lualine/lualine.nvim", -- Lualine
	"tpope/vim-dadbod", -- SQL Browser
	"abecodes/tabout.nvim", -- Press Tab to get out of brackets
	"chentoast/marks.nvim", -- Better Marks
	"ggandor/leap.nvim", -- Better movement
	"kyazdani42/nvim-web-devicons", -- icons
	"nvim-tree/nvim-tree.lua", -- file tree
	"JoosepAlviste/nvim-ts-context-commentstring", -- comment out react code in typescript
	"numToStr/Comment.nvim", -- Comment keybinds
	"melkster/modicator.nvim", -- Show different color of line num based on mode
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"tpope/vim-repeat", -- repeat plugin command with .
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"ThePrimeagen/harpoon", -- bookmarks
	"szw/vim-maximizer", -- Maximize split with keypress
	-- colorschemes
	"ellisonleao/gruvbox.nvim",
	"frenzyexists/aquarium-vim",
	"marko-cerovac/material.nvim",
	"bluz71/vim-nightfly-guicolors", -- current choice
	"catppuccin/nvim",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	"rcarriga/nvim-notify",
	"MunifTanjim/nui.nvim", -- required UI Lib for noice
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	{ "romgrk/barbar.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{ "romgrk/barbar.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } }, --tabline plugin
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp ui's
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" }, -- autoclose tags
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		dependencies = "lualine.nvim", -- whichever statusline plugin you use here
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({})
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				formatters = {
					insert_text = require("copilot_cmp.format").remove_existing,
				},
			})
		end,
	},
})

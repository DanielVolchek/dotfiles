--- Old plugins-setup file using packer.nvim, not relevant after switching to LazyNvim
---
---
---@diagnostic disable: param-type-mismatch
-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- undo tree
	use("mbbill/undotree")

	--colorschemes
	use("Mofiqul/dracula.nvim")
	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")
	use("catppuccin/nvim")
	use("bluz71/vim-nightfly-guicolors") -- current choice
	use("marko-cerovac/material.nvim")
	use("frenzyexists/aquarium-vim")
	use("ellisonleao/gruvbox.nvim")
	use("rebelot/kanagawa.nvim")

	-- symboltree
	use("simrat39/symbols-outline.nvim")

	--tab bar
	use({ "romgrk/barbar.nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	use("ThePrimeagen/harpoon") -- bookmarks

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("tpope/vim-repeat") -- repeat plugin command with .
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- colored line num to indicate mode
	use("melkster/modicator.nvim")

	-- commenting with gc
	use("numToStr/Comment.nvim")
	--ts comment context
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- movement
	use("ggandor/leap.nvim")

	-- marks
	use("chentoast/marks.nvim")

	--tabout
	use("abecodes/tabout.nvim")
	-- dashboard
	-- use({
	-- 	"glepnir/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		_G.initDash = true
	-- 		-- reset dash so we can reload it
	-- 		package.loaded[config.plugindir .. "dashboard"] = nil
	-- 		local db_status, db_ok = pcall(require, config.plugindir .. "dashboard")
	-- 		if not db_status then
	-- 			return
	-- 		end
	-- 	end,
	-- 	requires = { "nvim-tree/nvim-web-devicons" },
	-- })
	--
	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	-- use({ "/Users/danielvolchek/code/plugins/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- todo
	use("DanielVolchek/tailiscope.nvim")
	-- use("/Users/danielvolchek/code/plugins/tailiscope")

	--which key for keybindings
	use("folke/which-key.nvim")

	-- copilot lua implementation to allow cmp suggestions
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	after = "lualine.nvim", -- whichever statusline plugin you use here
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup({
	-- 				suggestion = { enabled = false },
	-- 			})
	-- 		end, 100)
	-- 	end,
	-- })
	-- toggleterm
	use("akinsho/toggleterm.nvim")
	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			formatters = {
	-- 				insert_text = require("copilot_cmp.format").remove_existing,
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("ray-x/lsp_signature.nvim") -- lsp signatures
	use("folke/trouble.nvim") -- lsp diagnostics"
	use("nvim-lua/lsp-status.nvim")
	-- formatting & linting
	use("nvimtools/none-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	--obsidian integration
	use("epwalsh/obsidian.nvim")

	-- neovim plugin development tools
	use("folke/neodev.nvim")
	-- use("bfredl/nvim-luadev")

	--colors
	use("uga-rosa/ccc.nvim")
	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- better escape
	use("max397574/better-escape.nvim")

	-- git integration
	-- use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("f-person/git-blame.nvim") -- show git blame on line

	-- better split resizing
	use("mrjones2014/smart-splits.nvim")

	-- open files in nvim terminal in nvim
	-- todo get this working
	use("willothy/flatten.nvim")

	use({ "Bryley/neoai.nvim", requires = "MunifTanjim/nui.nvim" })
	use("uga-rosa/cmp-dictionary")
	use("stevearc/oil.nvim")

	-- mini modules
	use("echasnovski/mini.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	use("nvim-pack/nvim-spectre")

	if packer_bootstrap then
		require("packer").sync()
	end
end)

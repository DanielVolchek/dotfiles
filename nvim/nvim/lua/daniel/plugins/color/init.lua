return {
	-- colorpicker
	{
		"uga-rosa/ccc.nvim",
		keys = {
			{ "<leader>cp", "<cmd>CccPick<CR>", desc = "Color Picker" },
		},
	},
	-- colorschemes
	{
		-- current colorscheme gets priority 1000 to load on start
		"EdenEast/nightfox.nvim",
		priority = 1000,

		config = function()
			require("nightfox").setup({
				palettes = {
					carbonfox = {
						comment = "#d3d3d3", -- Replace with your preferred color
					},
				},
			})

			vim.cmd("colorscheme carbonfox")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
	},

	-- nvim-web-devicon
	{
		"nvim-tree/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			local icons = require("nvim-web-devicons")
			icons.setup({
				override_by_filename = {
					[".nvimroot"] = {
						icon = "",
						color = "#51a0cf",
						name = "nvimroot",
					},
				},
			})
		end,
	},

	{ "melkster/modicator.nvim", event = "BufEnter" },
}

-- "Mofiqul/dracula.nvim",
-- "folke/tokyonight.nvim",
-- "EdenEast/nightfox.nvim",
-- "catppuccin/nvim",
-- "bluz71/vim-nightfly-guicolors",
-- "marko-cerovac/material.nvim",
-- "frenzyexists/aquarium-vim",
-- "ellisonleao/gruvbox.nvim",
-- "rebelot/kanagawa.nvim",

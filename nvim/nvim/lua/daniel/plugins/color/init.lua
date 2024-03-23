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
			vim.cmd("colorscheme carbonfox")
		end,
	},

	-- nvim-web-devicon
	{
		"kyazdani42/nvim-web-devicons",
		event = "BufEnter",
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

return {
	-- colorpicker
	{
		"uga-rosa/ccc.nvim",
		lazy = false,
		keys = {
			{ "<leader>cp", "<cmd>CccPick<CR>", desc = "Color Picker" },
		},
	},
	-- colorschemes
	{
		-- current colorscheme gets priority 1000 to load on start
		"EdenEast/nightfox.nvim",
		priority = 1000,
		lazy = false,
	},
	{ "Mofiqul/dracula.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "catppuccin/nvim" },
	{ "bluz71/vim-nightfly-guicolors" },
	{ "marko-cerovac/material.nvim" },
	{ "frenzyexists/aquarium-vim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "rebelot/kanagawa.nvim" },

	-- nvim-web-devicon
	{ "kyazdani42/nvim-web-devicons" },
}

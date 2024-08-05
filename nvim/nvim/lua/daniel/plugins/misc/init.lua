return {
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	-- "MunifTanjim/nui.nvim", -- required UI Lib for noice
	"szw/vim-maximizer",
	"tpope/vim-repeat", -- repeat plugin command with .
	{
		"f-person/git-blame.nvim",
		lazy = false,
	},
	{
		"ThePrimeagen/vim-be-good",
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}

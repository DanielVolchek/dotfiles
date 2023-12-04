-- import lspsaga safely
return {
	"glepnir/lspsaga.nvim",
	branch = "main",
	event = "BufEnter",
	opts = {
		-- keybinds for navigation in lspsaga window
		move_in_saga = { prev = "<C-k>", next = "<C-j>" },
		code_action_lightbulb = {
			virtual_text = false,
		},

		finder = {
			default = "def+ref+imp",
			keys = {
				open = "<CR>",
				vsplit = "v",
				split = "s",
			},
		},
		-- use enter to open file with finder
		-- use enter to open file with definition preview
		definition_action_keys = {
			edit = "<CR>",
		},
		rename_action_quit = { "<C-c>", "<Esc>" },

		ui = {
			border = "double",
		},
	},
}

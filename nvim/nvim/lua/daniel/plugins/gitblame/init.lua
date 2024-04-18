-- make sure Git Blame is disabled before startup by executing command
-- todo do this in lua
-- in theory because we are lazy loading on keypress I no longer need this
-- vim.cmd("let g:gitblame_enabled = 0")

return {
	"f-person/git-blame.nvim",
	keys = {
		{ "<leader>gb", "<CMD>GitBlameToggle<CR>", desc = "Toggle Git Blame" },
	},
}

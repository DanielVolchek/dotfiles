local maps = config.maps
-- telescope
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope <cr>", { desc = "List All Available Telescope Commands" }) -- Full Telescope Command List
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find Files in CWD" }) -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy Find String in CWD" }) -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy Find String Under Cursor" }) -- find string under cursor in current working directory
vim.keymap.set(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers<cr>",
	{ desc = " list open buffers in current neovim instance" }
) -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = " list available help tags" }) -- list available help tags
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = " list frecency projects" }) -- list frecency projects
vim.keymap.set(
	"n",
	"<leader>fm",
	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	{ desc = " list frecency projects" }
) -- list frecency projects
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume Last Open Selector" }) -- list frecency projects
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Open List of oldfiles" }) -- list oldfiles from vim.info
vim.keymap.set("n", "<leader>fn", "<cmd>Noice telescope<cr>", { desc = "Open Noice" }) -- Show Noice Outputs in Telescope picker
-- telescope git commands (not on youtube nvim video)
vim.keymap.set(
	"n",
	"<leader>gc",
	"<cmd>Telescope git_commits<cr>",
	{ desc = ' list all git commits (use <cr> to checkout) ["gc" for git commits]' }
) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set(
	"n",
	"<leader>gcf",
	"<cmd>Telescope git_bcommits<cr>",
	{ desc = ' list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]' }
) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set(
	"n",
	"<leader>gB",
	"<cmd>Telescope git_branches<cr>",
	{ desc = ' list git branches (use <cr> to checkout) ["gb" for git branch]' }
) -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set(
	"n",
	"<leader>gs",
	"<cmd>Telescope git_status<cr>",
	{ desc = ' list current changes per file with diff preview ["gs" for git status]' }
) -- list current changes per file with diff preview ["gs" for git status]
vim.keymap.set("n", "<C-w>b", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
vim.keymap.set("n", "<C-w>f", "<cmd>Telescope find_files<cr>", { desc = "Find files in CWD" })

vim.keymap.set("n", "fw", "<cmd>Telescope tailiscope categories<cr>")
vim.keymap.set("n", "fl", "<cmd>Telescope help_string<cr>")

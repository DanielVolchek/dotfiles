-- make sure Git Blame is disabled before startup by executing command
vim.cmd("let g:gitblame_enabled = 0")
vim.keymap.set("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })

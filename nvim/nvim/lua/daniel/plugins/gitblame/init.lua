-- make sure Git Blame is disabled before startup
-- execute GitBlameToggle to disable it

vim.keymap.set("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle Git Blame" })

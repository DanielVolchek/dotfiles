--tree shortcuts
vim.keymap.set(
	"n",
	"<leader>nt",
	"<cmd>NvimTreeToggle<CR>",
	{ silent = true, noremap = true, desc = "Toggle File Tree" }
)
vim.keymap.set("n", "<leader>nm", "<cmd>NvimTreeOpen<CR>", { desc = "Open File Tree" })
vim.keymap.set("n", "<leader>nM", "<cmd>NvimTreeClose<CR>", { desc = "Close File Tree" })
--symbolstree shortcuts
vim.keymap.set("n", "<leader>st", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Tree" })
vim.keymap.set("n", "<leader>sm", "<cmd>SymbolsOutlineOpen<CR>", { desc = "Open Symbols Tree" })
vim.keymap.set("n", "<leader>sM", "<cmd>SymbolsOutlineClose<CR>", { desc = "Close Symbols Tree" })

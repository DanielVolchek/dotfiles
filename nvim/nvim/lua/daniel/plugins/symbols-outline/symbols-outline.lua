local status, symbols_outline = pcall(require, "symbols-outline")
if not status then
	print("Error loading symbols_outline")
	return
end

symbols_outline.setup(opts)

vim.keymap.set("n", "<leader>st", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Tree" })
vim.keymap.set("n", "<leader>sm", "<cmd>SymbolsOutlineOpen<CR>", { desc = "Open Symbols Tree" })
vim.keymap.set("n", "<leader>sM", "<cmd>SymbolsOutlineClose<CR>", { desc = "Close Symbols Tree" })

-- buffers
local CloseIfLast = function()
	local count = vim.api.nvim_win_get_number(vim.api.nvim_get_current_win())
	if count == 1 then
		vim.cmd("BufferClose")
	else
		vim.cmd("normal! c")
	end
end
vim.keymap.set("n", "<leader>bn", "<cmd>BufferNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bC", "<cmd>bd!<CR>", { desc = "Close Buffer" })
-- c-w binds
vim.keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<CR>", { desc = "Maximize Current Split" })
vim.keymap.set("n", "<C-w>c", function()
	CloseIfLast()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<C-w><C-l>", "<cmd>BufferNext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<C-w><C-h>", "<cmd>BufferPrevious<cr>", { desc = "Go to previous buffer" })

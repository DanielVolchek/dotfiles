-- buffers
local CloseIfLast = function(force)
	-- local split_count = vim.cmd("echo tabpagewinnr(tabpagenr(), '$')")
	local split_count = #vim.api.nvim_tabpage_list_wins(0)
	-- if only one split close buffer
	if split_count == 1 then
		-- -- if last buffer close nvim
		-- local buf_count = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
		-- P("count is ")
		-- P(buf_count)
		-- if buf_count == 1 then
		-- 	vim.cmd("wq")
		-- end
		-- -- otherwise close the buffer
		local cmd = "BufferClose"
		if force then
			cmd = cmd .. "!"
		end
		vim.cmd(cmd)
	-- if more than one window close split
	else
		vim.cmd("normal! c")
	end
end
vim.keymap.set("n", "<leader>bn", "<cmd>BufferNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", function()
	CloseIfLast()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bC", "<cmd>bd!<CR>", { desc = "Close Buffer" })
-- c-w binds
vim.keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<CR>", { desc = "Maximize Current Split" })
vim.keymap.set("n", "<C-w>z", "<cmd>MaximizerToggle<CR>", { desc = "Maximize Current Split" })
vim.keymap.set("n", "<C-w>c", function()
	CloseIfLast()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<C-w>C", function()
	CloseIfLast(true)
end, { desc = "Force close Buffer" })
vim.keymap.set("n", "<C-w><C-l>", "<cmd>BufferNext<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<C-w><C-h>", "<cmd>BufferPrevious<cr>", { desc = "Go to previous buffer" })

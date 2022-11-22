-- local status, barbar = pcall(require, "barbar")
-- if not status then
-- 	return
-- end

-- prevents first tab from showing im nvim-tree
local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)

--reorder buffers after adding/deleting new buffer
local group = vim.api.nvim_create_augroup("barbar_sort", { clear = true })

vim.api.nvim_create_autocmd("BufAdd", {
	pattern = "*",
	callback = function()
		vim.cmd("BufferOrderByBufferNumber")
	end,
	group = group,
})

vim.api.nvim_create_autocmd("BufDelete", {
	pattern = "*",
	callback = function()
		vim.cmd("BufferOrderByBufferNumber")
	end,
	group = group,
})

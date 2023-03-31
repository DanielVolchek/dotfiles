local ok, smart_splits = pcall(require, "smart-splits")
if not ok then
	return
end

smart_splits.setup({})
vim.keymap.set("n", "<C-w>r", function()
	smart_splits.start_resize_mode()
end, { noremap = true })

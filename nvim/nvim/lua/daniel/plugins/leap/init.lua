local status, leap = pcall(require, "leap")
if not status then
	return
end
-- leap.add_default_mappings()
vim.keymap.set("n", "s", function()
	leap.leap({ target_windows = { vim.fn.win_getid() } })
end)

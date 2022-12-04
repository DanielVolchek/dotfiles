vim.keymap.set("n", "gl", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gl"
	end
end, { noremap = false, expr = true, desc = "ObsidianFollowLink" })

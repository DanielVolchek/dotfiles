-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("trail: ")

local status, indent = pcall(require, "indent_blankline")
if not status then
	return
end

indent.setup({
	-- char = "┆",
	show_current_context = true,
	filetype_exclude = {
		"dashboard",
	},
})

-- vim.opt.termguicolors = true
-- vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])
-- vim.opt.listchars:append("space:⋅")
--
-- require("indent_blankline").setup({
-- 	char = "┆",
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 	},
-- 	space_char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 	},
-- 	show_trailing_blankline_indent = false,
-- })

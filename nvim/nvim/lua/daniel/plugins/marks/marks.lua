local status, marks = pcall(require, "marks")
if not status then
	return
end

marks.setup({
	mappings = {
		preview = "m;",
		set_next = "mm",
		next = "m.",
		prev = "m,",
		delete_line = "dmm",
	},
})

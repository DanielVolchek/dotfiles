local status, betteresc = pcall(require, "better_escape")
if not status then
	return
end

betteresc.setup({
	mapping = { "jk" },
})

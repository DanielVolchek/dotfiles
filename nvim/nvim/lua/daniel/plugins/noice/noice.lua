local status, noice = pcall(require, "noice")
if not status then
	return
end

noice.setup({
	lsp = {
		signature = {
			enabled = true,
		},
	},
})

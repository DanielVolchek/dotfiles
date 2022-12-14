local status, noice = pcall(require, "noice")
if not status then
	return
end

noice.setup({
	-- show function signature while typing
	-- might replace with lspsignature
	messages = {
		enabled = false,
	},
	cmdline = {
		enabled = false,
	},
	lsp = {
		signature = {
			enabled = true,
		},
	},

	-- autocomplete in cmd as box underneath
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
})

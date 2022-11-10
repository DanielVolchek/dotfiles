local status, tterm = pcall(require, "toggleterm")
if not status then
	return
end

-- todo add option to set terminal in split on bottom of screen
tterm.setup({
	size = 5,
	open_mapping = [[<F7>]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local status, which_key = pcall(require, "which-key")
if not status then
	return
end

local opts = {
	window = {
		border = "double", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 15 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 5, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
}

which_key.setup(opts)
which_key.register({
	-- todo
})

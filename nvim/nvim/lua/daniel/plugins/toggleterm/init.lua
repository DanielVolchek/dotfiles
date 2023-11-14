local plugindir = config.plugindir .. "toggleterm."
require(plugindir .. "toggleterm")
require(plugindir .. "keymaps")

return {
	"akinsho/toggleterm.nvim",
	opts = {
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
	},
}

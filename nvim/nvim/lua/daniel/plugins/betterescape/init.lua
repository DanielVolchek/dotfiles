local plugindir = config.plugindir .. "betterescape."
-- require(plugindir .. "betterescape")

return {
	"max397574/better-escape.nvim",
	lazy = false,
	opts = {
		mapping = { "jk" },
	},
}

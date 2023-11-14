local plugindir = config.plugindir .. "nvim-tree."
require(plugindir .. "nvim-tree")
require(plugindir .. "keymaps")

return {
	"nvim-tree/nvim-tree.lua",
}

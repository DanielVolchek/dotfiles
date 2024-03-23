return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		local plugindir = config.plugindir .. "nvim-tree."
		require(plugindir .. "nvim-tree")
		require(plugindir .. "keymaps")
	end,
}

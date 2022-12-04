local plugindir = config.plugindir .. "obsidian."

require("obsidian").setup({
	dir = config.obsidianDir,
	completion = {
		nvim_cmp = true,
	},
	daily_notes = {
		folder = "daily",
	},
})

require(plugindir .. "keymaps")

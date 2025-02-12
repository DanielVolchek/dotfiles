-- Place this in your init.lua or early in your config
vim.g.firenvim_config = {
	localSettings = {
		[".*"] = {
			priority = 0,
			takeover = "never",
		},
		["https?://github.com/.*"] = {
			priority = 1,
			takeover = "always",
		},
	},
}

-- In your plugins configuration file
return {
	"glacambre/firenvim",
	-- Uncomment the next line to enable lazy loading
	lazy = not vim.g.started_by_firenvim,
	build = function()
		vim.fn["firenvim#install"](0)
	end,
}

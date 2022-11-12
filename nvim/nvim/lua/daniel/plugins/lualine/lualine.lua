-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local colors = {
	blue = "#3EFFDC",
	green = "#3eff5c",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = colors.green
lualine_nightfly.insert.a.bg = colors.blue
lualine_nightfly.visual.a.bg = colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = colors.yellow,
		fg = colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	sections = {
		lualine_x = {
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#fff" },
			},
		},
	},

	options = {
		theme = lualine_nightfly,
	},
})

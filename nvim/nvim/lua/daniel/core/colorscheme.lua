-- set colorscheme
-- local CUSTOM_SCHEMES = {
-- 	"colorscheme tokyonight-dark",
-- 	"colorscheme dracula",
-- 	"colorscheme nightfly",
-- }

local status, tokyonight = pcall(require, "tokyonight")
if not status then
	return
end

local iconload, icons = pcall(require, "nvim-web-devicons")
if not iconload then
	return
end

icons.set_icon({
	astro = {
		icon = "異",
		color = "#82aaff",
		name = "Astro",
		-- icon_hl = "#82aaff",
	},
})

tokyonight.setup({
	style = "moon",
	on_highlights = function(hl, colors)
		hl.NvimTreeFolderIcon = {
			bg = "NONE",
			fg = colors.yellow,
		}
		hl.NvimTreeRootFolder = {
			bold = true,
			fg = colors.white,
		}
	end,
})

-- current fav = tokyonight
-- current = carbonfox
local scheme = "colorscheme carbonfox"
local status, _ = pcall(vim.cmd, scheme)
if not status then
	return
end

local colors = {
	bg = "#282A36",
	fg = "#F8F8F2",
	selection = "#44475A",
	comment = "#6272A4",
	red = "#FF5555",
	orange = "#FFB86C",
	yellow = "#F1FA8C",
	green = "#50fa7b",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	pink = "#FF79C6",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	light_green = "#3eff5c",
	bright_magenta = "#FF92DF",
	bright_cyan = "#00ffff",
	bright_white = "#FFFFFF",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",
}

-- changes color of line number based on mode
local status_, modicator = pcall(require, "modicator")
if not status_ then
	return
end

modicator.setup({
	-- highlights = {
	-- 	modes = {
	-- 		["i"] = { foreground = colors.bright_cyan },
	-- 		["n"] = { foreground = colors.light_green },
	-- 		["v"] = { foreground = colors.bright_magenta },
	-- 		["V"] = { foreground = colors.bright_magenta },
	-- 		["R"] = { foreground = colors.bright_red },
	-- 		["t"] = { foreground = colors.bright_magenta },
	-- 		["c"] = { foreground = colors.bright_yellow },
	-- 	},
	-- },
})

-- modes = {
--   ['n'] = {
--     foreground = M.get_highlight_fg('CursorLineNr'),
--   },

if config.transparent then
	vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "NONE", bg = "NONE" })
end

-- cmd line color
vim.api.nvim_set_hl(0, "MsgArea", { bg = "#000000" })

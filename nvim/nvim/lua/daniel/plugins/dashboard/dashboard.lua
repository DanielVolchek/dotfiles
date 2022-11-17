local home = os.getenv("HOME")
local status, db = pcall(require, "dashboard")
if not status then
	return
end

-- b.custom_header = {
-- 	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
-- 	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
-- 	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
-- 	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
-- 	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
-- 	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
-- }

-- local customheaders = {
-- 	{
-- 		"",
-- 		"                                         _.oo.",
-- 		"                 _.u[[/;:,.         .odMMMMMM'",
-- 		"              .o888UU[[[/;:-.  .o@P^    MMM^  ",
-- 		"             oN88888UU[[[/;::-.        dP^    ",
-- 		"            dNMMNN888UU[[[/;:--.   .o@P^      ",
-- 		"           ,MMMMMMN888UU[[/;::-. o@^          ",
-- 		"           NNMMMNN888UU[[[/~.o@P^             ",
-- 		"           888888888UU[[[/o@^-..              ",
-- 		"          oI8888UU[[[/o@P^:--..               ",
-- 		"       .@^  YUU[[[/o@^;::---..                ",
-- 		"     oMP     ^/o@P^;:::---..                  ",
-- 		"  .dMMM    .o@^ ^;::---...                    ",
-- 		" dMMMMMMM@^`       `^^^^                      ",
-- 		"YMMMUP^                                       ",
-- 		" ^^                                           ",
-- 		"",
-- 	},
-- }

if vim.fn.executable("cbonsai") == 1 then
	-- check if cbonsai exists
	db.preview_command = "cbonsai -l -i -M 3 -t .02  -L 28 -p | cat"
	db.preview_file_path = ""
else
	-- notify user and set preview to cat backup file
	vim.notify("cbonsai not installed, displaying static backup file - check dashboard/dashboard.lua for more info")
	-- todo I know there is a way to get this dynamically
	db.preview_file_path = vim.fn.stdpath("config") .. "/lua/daniel/plugins/dashboard/header.txt"
	db.preview_command = "cat"
end

db.preview_file_height = 25
db.preview_file_width = 75

-- auto save settings
db.session_auto_save_on_exit = true
db.session_directory = home .. "/.autosavenvim/"

db.custom_center = {
	{
		icon = "  ",
		desc = "Last Session          ",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files ",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "File Browser          ",
		action = "NvimTreeToggle",
	},
	{
		icon = "  ",
		desc = "Telescope             ",
		action = "Telescope ",
	},
	{
		icon = "  ",
		desc = "Find File             ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
	},
	{
		icon = "  ",
		desc = "Find String           ",
		action = "Telescope live_grep",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Find Project          ",
	-- 	action = "Telescope projects",
	-- },
	{
		icon = "  ",
		desc = "Config                ",
		action = "EditConfig",
	},
}

db.custom_footer = { "" }

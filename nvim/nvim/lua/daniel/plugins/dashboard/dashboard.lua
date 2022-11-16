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

-- db.custom_header = customheaders[1]
db.preview_command = "cat | lolcat -F 0.5"
db.preview_file_path = home .. "/.config/nvim/lua/daniel/plugins/dashboard/header.txt"
db.preview_file_height = 15
db.preview_file_width = 46

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
	{
		icon = "  ",
		desc = "Find Project          ",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Config                ",
		action = "EditConfig",
	},
}

db.custom_footer = { "" }

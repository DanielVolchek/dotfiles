local home = os.getenv("HOME")
local status, db = pcall(require, "dashboard")
if not status then
	return
end

db.custom_header = {
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

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
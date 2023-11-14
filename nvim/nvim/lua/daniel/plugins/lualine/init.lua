return {
	"nvim-lualine/lualine.nvim",
	priority = 500,
	lazy = false,
	config = function()
		local ok, lualine = pcall(require, "lualine")
		if not ok then
			return
		end

		-- new colors for theme
		local colors = {
			blue = "#3EFFDC",
			green = "#3eff5c",
			violet = "#FF61EF",
			yellow = "#ffe249",
			black = "#000000",
			white = "#FFFFFF",
		}

		-- change nightlfy theme colors
		-- lualine_nightfly.normal.a.bg = colors.green
		-- lualine_nightfly.insert.a.bg = colors.blue
		-- lualine_nightfly.visual.a.bg = colors.violet
		-- lualine_nightfly.command = {
		-- 	a = {
		-- 		gui = "bold",
		-- 		bg = colors.yellow,
		-- 		fg = colors.white, -- black
		-- 	},
		-- }

		local theme = require("lualine.themes.codedark")
		theme.command = {
			a = {
				gui = "bold",
				bg = colors.yellow,
				fg = colors.white,
			},
		}

		-- lsp-status component
		-- local getlspstatus = function()
		-- 	local _ok, lsp_status = pcall(require, "lsp-status")
		-- 	if not _ok or #vim.lsp.get_active_clients() <= 0 then
		-- 		return ""
		-- 	end
		-- 	local status = lsp_status.status()
		-- 	if #status > 35 then
		-- 		return status:sub(1, 35) .. "..."
		-- 	end
		-- 	return status
		-- end
		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_a = {
					{
						"mode",
					},
				},
				-- lualine_x = {
				-- 	{
				-- 		getlspstatus,
				-- 	},
				-- },
			},

			options = {
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
		})

		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
	end,
}

return {
	"ggandor/leap.nvim",
	keys = {
		keys = {
			{
				"s",
				function()
					vim.cmd("normal m'")
					require("leap").leap({ target_windows = { vim.fn.win_getid() } })
				end,
			},
		},
	},
}

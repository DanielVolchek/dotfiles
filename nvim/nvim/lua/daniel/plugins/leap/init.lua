return {
	"ggandor/leap.nvim",
	keys = {
		keys = {
			{
				"s",
				function()
					require("leap").leap({ target_windows = { vim.fn.win_getid() } })
				end,
			},
		},
	},
}

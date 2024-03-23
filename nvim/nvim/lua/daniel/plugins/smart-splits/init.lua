return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		{
			"<C-w>r",
			function()
				require("smart-splits").start_resize_mode()
			end,
		},
	},
}

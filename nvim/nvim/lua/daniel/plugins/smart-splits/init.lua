return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		{
			"<C-w>r",
			function()
				require("smart_splits").start_resize_mode()
			end,
		},
	},
}

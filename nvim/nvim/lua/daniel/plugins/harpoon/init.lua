return {
	"ThePrimeagen/harpoon",
	lazy = true,
	keys = {
		{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon Add" },
		{ "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Marks" },
		{ "<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
		{ "<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>" },
		{ "<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>" },
		{ "<leader>hl", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>" },
	},
}

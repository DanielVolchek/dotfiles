return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ha" },
		{ "<leader>hm" },
		{ "<leader>hh" },
		{ "<leader>hj" },
		{ "<leader>hk" },
		{ "<leader>hl" },
		{ "<leader>hb" },
		{ "<leader>hn" },
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<leader>hm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end)

		vim.keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end)

		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end)

		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<leader>hb", function()
			harpoon:list():prev()
		end)

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end)
	end,
}

-- "<cmd>lua require('harpoon.mark').add_file()<cr>"

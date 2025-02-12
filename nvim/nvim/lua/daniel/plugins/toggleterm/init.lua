return {
	"akinsho/toggleterm.nvim",

	-- keys = {},
	event = "BufEnter",

	opts = {
		size = 5,
		open_mapping = [[<F7>]],
		shading_factor = 2,
		direction = "float",
		float_opts = {
			border = "curved",
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},

	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- toggleterm
		function config.toggle_term_cmd(term_details)
			vim.notify("termdetails is " .. term_details)
			-- if a command string is provided, create a basic table for Terminal:new() options
			if type(term_details) == "string" then
				term_details = { cmd = term_details, hidden = true }
			end
			-- use the command as the key for the table
			local term_key = term_details.cmd
			-- set the count in the term details
			if vim.v.count > 0 and term_details.count == nil then
				term_details.count = vim.v.count
				term_key = term_key .. vim.v.count
			end
			-- if terminal doesn't exist yet, create it
			if config.user_terminals[term_key] == nil then
				config.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
			end
			-- toggle the terminal
			config.user_terminals[term_key]:toggle()
		end

		vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal Split" })
		vim.keymap.set("n", "<leader>tn", function()
			config.toggle_term_cmd("node")
		end, { desc = "Toggle Node Terminal" })
		vim.keymap.set("n", "<leader>tg", function()
			config.toggle_term_cmd("lazygit")
		end, { desc = "Toggle LazyGit" })
		vim.keymap.set("n", "<leader>lg", function()
			config.toggle_term_cmd("lazygit")
		end, { desc = "Toggle LazyGit" })
		vim.keymap.set("n", "<leader>tm", function()
			config.toggle_term_cmd("glow " .. vim.api.nvim_buf_get_name(0) .. " -p")
		end, { desc = "ToggleTerm markdown" })
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
		vim.keymap.set(
			"n",
			"<leader>ts",
			"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
			{ desc = "ToggleTerm horizontal split" }
		)
		vim.keymap.set(
			"n",
			"<leader>tv",
			"<cmd>ToggleTerm size=80 direction=vertical<cr>",
			{ desc = "ToggleTerm vertical split" }
		)

		vim.keymap.set("n", "<C-w>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Term Split" })

		function _G.set_terminal_keymaps()
			local term_opts = { buffer = 0 }
			-- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
			-- vim.keymap.set("t", "JK", [[<C-\><C-n>]], term_opts)
			vim.keymap.set("t", "", [[<C-\><C-n><C-w>]], term_opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}

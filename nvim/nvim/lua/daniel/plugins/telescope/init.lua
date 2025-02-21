return {
	{
		"DanielVolchek/tailiscope.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			event = "VimEnter",

			keys = {
				{ "<leader>ft", "<cmd>Telescope <cr>", desc = "List All Available Telescope Commands" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy Find Files in CWD" },
				{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Fuzzy Find String in CWD" },
				{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Fuzzy Find String Under Cursor" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Open Buffers in Current Neovim Instance" },
				{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List Available Help Tags" },
				{ "<leader>fp", "<cmd>Telescope<cr>", desc = "List Pickers" },
				{ "<leader>fm", "<cmd>Telescope treesitter<cr>", desc = "List Treesitter Symbols (In File)" },
				{
					"<leader>fM",
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					desc = "List LSP Symbols (In Project)",
				},
				{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Open Last Picker" },
				{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Open List of Recent Files" },
				{ "<leader>fn", "<cmd>Noice telescope<cr>", desc = "Open Noice" },
				{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "List All Git Commits" },
				{ "<leader>gcf", "<cmd>Telescope git_bcommits<cr>", desc = "List Git Commits for Current File/Buffer" },
				{ "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "List Git Branches" },
				{
					"<leader>gs",
					"<cmd>Telescope git_status<cr>",
					desc = "List Current Changes Per File with Diff Preview",
				},
				{ "<C-w>b", "<cmd>Telescope buffers<cr>", desc = "List Open Buffers" },
				{ "<C-w>f", "<cmd>Telescope find_files<cr>", desc = "Find Files in CWD" },
				{ "<leader>fw", "<cmd>Telescope tailisope categories<cr>" },
				{ "<leader>fl", "<cmd>Telescope registers<cr>" },
			},
			config = function()
				-- import telescope plugin safely
				local telescope_setup, telescope = pcall(require, "telescope")
				if not telescope_setup then
					return
				end

				-- import telescope actions safely
				local actions_setup, actions = pcall(require, "telescope.actions")
				if not actions_setup then
					return
				end

				-- configure telescope

				--on vsplit (<c-l>) resume last picker
				local split = function(prompt_bufnr)
					require("telescope.actions").file_vsplit(prompt_bufnr)
					require("telescope.builtin").resume()
				end

				telescope.setup({
					-- configure custom mappings
					pickers = {
						builtin = {
							include_extensions = true,
							file_ignore_patterns = {},
						},
						registers = {
							theme = "cursor",
						},
						planets = {
							show_pluto = true,
							show_moon = true,
						},
						find_files = {
							-- no_ignore = true,
							hidden = true,
							follow = true,
						},
						buffers = {
							sort_lastused = true,
							-- ignore_current_buffer = true,
							mappings = {
								i = {
									["<c-d>"] = actions.delete_buffer,
								},
								n = {
									["dd"] = actions.delete_buffer,
								},
							},
						},
					},
					defaults = {
						layout_strategy = "horizontal",
						layout_config = {
							width = 0.99,
							height = 0.99,
							preview_width = 0.7,
						},
						path_display = { "truncate", "smart" }, -- shorten path (also potentially needs change to truncate)
						prompt_prefix = "  ",
						file_ignore_patterns = { "node_modules", ".git" },
						selection_caret = "❯ ",
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-k>"] = actions.move_selection_previous, -- move to prev result
								["<C-j>"] = actions.move_selection_next, -- move to next result
								["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
								["<c-l>"] = split,
							},
							n = {
								["<c-l>"] = split,
								["q"] = actions.close, -- close telescope
								["<C-k>"] = actions.move_selection_previous, -- move to prev result
								["<C-j>"] = actions.move_selection_next, -- move to next result
							},
						},
					},
					extensions = {
						tailiscope = {
							register = '"',
							default = "all",
						},
					},
				})

				telescope.load_extension("fzf")
				telescope.load_extension("tailiscope")
				telescope.load_extension("harpoon")

				-- if nvim is opened without any args (aka not opening a file directly)
				if #vim.v.argv <= 2 then
					vim.cmd("Telescope find_files")
				end
			end,
		},
	},
}

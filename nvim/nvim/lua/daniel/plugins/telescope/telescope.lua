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
			previewer = false,
			layout_config = {
				width = 0.5,
				height = 0.75,
			},
		},
		planets = {
			show_pluto = true,
			show_moon = true,
		},
		find_files = {
			-- no_ignore = true,
			hidden = true,
			follow = true,
			layout_strategy = "horizontal",
			layout_config = {
				width = 0.75,
				height = 0.75,
				preview_cutoff = 120,
			},
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
})

telescope.load_extension("fzf")
telescope.load_extension("projects")

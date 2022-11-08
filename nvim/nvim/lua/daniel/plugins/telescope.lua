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
telescope.setup({
	-- configure custom mappings
	pickers = {
		builtin = {
			-- previewer = false,
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
			ignore_current_buffer = true,
		},
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = "❯ ",
		file_ignore_patterns = { "node_modules", ".git" },
		initial_mode = "normal",
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
			n = {
				["q"] = actions.close, -- close telescope]
				["dd"] = actions.delete_buffer, -- delete buffer
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("projects")

local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")
--
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function collapse_all()
	require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
	-- open as vsplit on current node
	local action = "edit"
	local node = lib.get_node_at_cursor()

	-- Just copy what's done normally with vsplit
	if node.link_to and not node.nodes then
		require("nvim-tree.actions.node.open-file").fn(action, node.link_to)
		view.close() -- Close the tree if file was opened
	elseif node.nodes ~= nil then
		lib.expand_or_collapse(node)
	else
		require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)
		view.close() -- Close the tree if file was opened
	end
end

local opts = {
	hijack_directories = {
		enable = false,
	},
	open_on_tab = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 100,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	actions = {
		open_file = {
			quit_on_open = false,
			window_picker = {
				enable = false,
			},
		},
	},
	view = {
		-- adaptive_size = true,
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 90,
				col = vim.o.columns / 2 - 45,
				height = 30,
				row = vim.o.lines / 2 - 15,
			},
		},
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "preview" },
				{ key = "L", action = "edit", action_cb = edit_or_open },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all", action_cb = collapse_all },
				{
					key = "<leader><leader>",
					action = "cd",
				},
			},
		},
	},

	renderer = {
		icons = {
			glyphs = {
				git = {},
			},
		},
	},
}

nvimtree.setup(opts)

return opts

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings

	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "L", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "<leader><leader>", api.tree.change_root_to_node, opts("CD"))
end

local opts = {
	on_attach = on_attach,
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
			enable = _G.config.floatFileTree,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 90,
				col = vim.o.columns / 2 - 45,
				height = 30,
				row = vim.o.lines / 2 - 15,
			},
		},
		-- mappings = {
		-- 	custom_only = false,
		-- 	list = {
		-- 		{ key = "l", action = "edit", action_cb = edit_or_open },
		-- 		{ key = "L", action = "edit", action_cb = edit_or_open },
		-- 		{ key = "h", action = "close_node" },
		-- 		{ key = "H", action = "collapse_all", action_cb = collapse_all },
		-- 		{
		-- 			key = "<leader><leader>",
		-- 			action = "cd",
		-- 		},
		-- 	},
		-- },
	},
	filters = {
		git_ignored = false,
	},
	renderer = {
		indent_width = 1,
		icons = {
			glyphs = {
				git = {},
			},
		},
		special_files = {
			"README.md",
			"readme.md",
			".nvimroot",
		},
	},
}

local toggleFloat = function(float)
	local nvimtree = require("nvim-tree")
	opts.view.float = opts.view.float or {}
	opts.view.float.enable = float
	nvimtree.setup(opts)
	vim.cmd("NvimTreeToggle")
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = opts,
	keys = {
		{ "<leader>nt", "<cmd>NvimTreeToggle<CR>" },
		{
			"<leader>nf",
			function()
				toggleFloat(true)
			end,
		},
		{
			"<leader>nm",
			function()
				toggleFloat(false)
			end,
		},
	},
}

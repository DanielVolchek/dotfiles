-- setup
require("daniel.plugins-setup")
require("daniel.config")

--load core
require("daniel.core.options") -- opts
require("daniel.core.keymaps") -- keymaps
require("daniel.core.colorscheme") -- colorscheme
require("daniel.core.commands") -- self-defined commands

-- load plugins
config.sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

--load maps
for mode, maps in pairs(config.maps) do
	for key, map in pairs(maps) do
		local opts = map.opts or {}
		opts.desc = opts.desc or maps.desc or "No Description Provided"
		opts.noremap = true
		opts.silent = true
		vim.api.nvim_set_keymap(mode, key, map[0], opts)
	end
end

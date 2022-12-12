-- todo
-- add mini
-- look into treesitter function surround
-- eagerly disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

_G.config = {}

-- setup
require("daniel.plugins-setup")

-- load config
require("daniel.config")

--load core
require("daniel.core")

-- load plugins
config.sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

--load maps
-- config.loadmaps(config.maps)

-- todo

-- add mini
-- look into treesitter function surround

-- eagerly disable netrw for nvim-tree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

_G.config = {}

-- setup
require("daniel.plugins-setup")

--load core
require("daniel.core")

--load config
require("daniel.config")

config.getRoot()

-- load plugins
config.sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

-- config.loadmaps(config.maps)

-- disable comment continuation
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

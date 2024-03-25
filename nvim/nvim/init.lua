-- todo

-- add mini
-- look into treesitter function surround

-- eagerly disable netrw for nvim-tree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

_G.config = {}

-- setup
require("daniel.config")
require("daniel.core")
require("daniel.lazy-setup")

config.getRoot()

-- load plugins
config.sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

-- config.loadmaps(config.maps)

-- Set filetype for har
-- TODO create new file in .core lib for autcmds
vim.api.nvim_exec(
	[[
  autocmd BufNewFile,BufRead *.har set filetype=har
]],
	false
)

-- disable comment continuation
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

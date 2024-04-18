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

-- disable comment continuation when entering newline
-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

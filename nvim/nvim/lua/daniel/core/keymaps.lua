vim.g.mapleader = " "

-- visual lines
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "H", "b")
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")
vim.keymap.set("n", "L", "w")

-- search word forward without moving
vim.keymap.set("n", "(", function()
	config.searchWithoutJump("*")
end)
--search word backwards without moving
vim.keymap.set("n", ")", function()
	config.searchWithoutJump("#")
end)

-- fix indentation
vim.keymap.set("n", "==", "gg=G<C-o>", { desc = "Fix Indentation In File" })
-- vim.keymap.set("n", "<leader>=", '"+', { desc = "Write to system buffer" })

-- remap 0 to ^ (go to first character of text instead of first character of line)
vim.keymap.set("n", "0", "^")

-- newline without going into insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Insert newline below" })
vim.keymap.set("n", "<leader>O", "O<Esc>j", { desc = "Insert newline above" })

-- Quickfix keymaps
vim.keymap.set("n", "<leader>qq", "<cmd>cclose<CR>", { desc = "Close Quickfix" })
vim.keymap.set("n", "<leader>qw", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<leader>qb", "<cmd>cprev<CR>", { desc = "Prev Quickfix" })
-- before

-- after
-- splits with tmux maps
vim.keymap.set("n", "<C-w>-", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-w>_", "<C-w>v", { desc = "Split window vertically" })

-- remap mb4 and mb5 to go up and down in jump list
-- TODO doesn't work rn, figure out why
vim.keymap.set("n", "<X1Mouse>", "<C-O>")
vim.keymap.set("n", "<X2Mouse>", "<C-I>")

-- remap some common typos when I save
vim.keymap.set("c", '"w', "w")
vim.keymap.set("c", "'w", "w")
vim.keymap.set("c", "we", "w")

-- remap c-f to go up half page (ctrl-u functionality) so c-d and c-f can be used to go down and up
vim.keymap.set("n", "<C-f>", "<C-u>")

-- Bind Q to the macro functionality (q)
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "q")

-- plugin keymaps are defined in their own dirs and sourced in plugindir/init
-- i.e telescope/init.lua sources telescope/keymap.lua
-- everything buffer related is in barbar

vim.keymap.set("n", "<leader>nor", "<cmd>set relativenumber!<CR>")

vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")

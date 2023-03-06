vim.g.mapleader = " "

-- visual lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })
vim.keymap.set("n", "<leader>/", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "4k")

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
vim.keymap.set("n", "<leader>=", '"+', { desc = "Write to system buffer" })

-- insert mode movement keymaps
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- newline without going into insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Insert newline below" })
vim.keymap.set("n", "<leader>O", "O<Esc>j", { desc = "Insert newline above" })

-- Quickfix keymaps
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>", { desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>qe", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
vim.keymap.set("n", "<leader>qw", "<cmd>cprev<CR>", { desc = "Prev Quickfix" })

-- plugin keymaps are defined in their own dirs and sourced in plugindir/init
-- i.e telescope/init.lua sources telescope/keymap.lua
-- everything buffer related is in barbar

vim.g.mapleader = " "

-- visual lines
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })
vim.keymap.set("n", "<leader>/", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")

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

-- open buffer in textedit so it is visually selectable in a way that registers for the system
vim.keymap.set(
	"v",
	"<leader>te",
	":'<,'> w !$XDG_CONFIG_HOME/nvim/openfrombuffer.sh<CR>",
	{ desc = "Open in textedit" }
)

-- plugin keymaps are defined in their own dirs and sourced in plugindir/init
-- i.e telescope/init.lua sources telescope/keymap.lua
-- everything buffer related is in barbar

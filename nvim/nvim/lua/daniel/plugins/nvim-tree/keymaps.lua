-- --tree shortcuts
vim.keymap.set(
	"n",
	"<leader>nt",
	"<cmd>NvimTreeToggle<CR>",
	{ silent = true, noremap = true, desc = "Toggle File Tree" }
)

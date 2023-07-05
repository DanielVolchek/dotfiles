-- --tree shortcuts
vim.keymap.set(
	"n",
	"<leader>nt",
	"<cmd>NvimTreeToggle<CR>",
	{ silent = true, noremap = true, desc = "Toggle File Tree" }
)
--symbolstree shortcuts
vim.keymap.set("n", "<leader>st", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Tree" })
vim.keymap.set("n", "<leader>sm", "<cmd>SymbolsOutlineOpen<CR>", { desc = "Open Symbols Tree" })
vim.keymap.set("n", "<leader>sM", "<cmd>SymbolsOutlineClose<CR>", { desc = "Close Symbols Tree" })

local toggleFloat = function(float)
	local plugindir = config.plugindir .. "nvim-tree."
	local nvimtree = require("nvim-tree")
	local opts = require(plugindir .. "nvim-tree")
	opts.view.float = opts.view.float or {}
	opts.view.float.enable = float
	nvimtree.setup(opts)
	vim.cmd("NvimTreeToggle")
end

vim.keymap.set("n", "<leader>nf", function()
	toggleFloat(true)
end)

vim.keymap.set("n", "<leader>nm", function()
	toggleFloat(false)
end, { desc = "Open File Tree" })

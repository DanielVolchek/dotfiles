local plugindir = config.plugindir .. "ccc."
require(plugindir .. "ccc")
vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })

vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Harpoon Add" })
vim.keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Harpoon Marks" })

vim.keymap.set("n", "h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
vim.keymap.set("n", "j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
vim.keymap.set("n", "k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
vim.keymap.set("n", "l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")

--vim surround
-- change quotation to react template literal form
-- vim.keymap.set("n", "<leader>tls", 'cs"`ysa`{')
vim.keymap.set("n", "<leader>tls", 'cs"`ysa`B', { desc = "Template Literal Surround", remap = true })

require("neoai").setup({
	open_api_key_env = "OPEN_KEY",
	ui = { width = 50 },
})

vim.keymap.set("n", "<leader>ai", "<cmd>NeoAI<cr>", { noremap = true, desc = "Toggle NeoAI" })
vim.keymap.set(
	"v",
	"<leader>ac",
	"<cmd>NeoAIContext<cr>",
	{ noremap = true, desc = "Toggle NeoAI with context (visual selection)" }
)

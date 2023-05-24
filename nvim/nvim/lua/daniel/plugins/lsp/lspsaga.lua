-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

-- saga.init_lsp_saga({
-- 	-- keybinds for navigation in lspsaga window
-- 	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
-- 	code_action_lightbulb = {
-- 		virtual_text = false,
-- 	},
--
-- 	-- use enter to open file with finder
-- 	finder_action_keys = {
-- 		open = "<CR>",
-- 		vsplit = "v",
-- 		split = "s",
-- 	},
-- 	-- use enter to open file with definition preview
-- 	definition_action_keys = {
-- 		edit = "<CR>",
-- 	},
-- 	rename_action_quit = { "<C-c>", "<Esc>" },
-- })
--
--

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	code_action_lightbulb = {
		virtual_text = false,
	},

	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
		vsplit = "v",
		split = "s",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
	rename_action_quit = { "<C-c>", "<Esc>" },

	ui = {
		border = "double",
	},
})

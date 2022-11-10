vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })
keymap.set("n", "<leader>/", "<cmd>nohl<CR>", { desc = "Hide Search Highlights" })

keymap.set("n", "x", '"_x')
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "J", "5j")
keymap.set("n", "K", "4k")

-- buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bb", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

keymap.set("n", "<leader>bc", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })
keymap.set("n", "<leader>bC", "<cmd>bd!<CR>", { desc = "Close Buffer" })
keymap.set("n", "<C-w>C", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })

local SearchWithoutJump = function(dir)
	vim.cmd(string.format("normal! %s", dir))
	local count = vim.fn.searchcount().total
	if count > 1 then
		vim.cmd("normal! ")
	end
end

-- search word forward without moving
keymap.set("n", "(", function()
	SearchWithoutJump("*")
end)
--search word backwards without moving
keymap.set("n", ")", function()
	SearchWithoutJump("#")
end)

keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<CR>", { desc = "Maximize Current Split" })
keymap.set("n", "<C-w>b", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })

-- fix indentation
keymap.set("n", "<leader>==", "gg=G<C-o>", { desc = "Fix Indentation In File" })

--tree shortcuts
keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", { silent = true, noremap = true, desc = "Toggle File Tree" })
keymap.set("n", "<leader>nm", "<cmd>NvimTreeOpen<CR>", { desc = "Open File Tree" })
keymap.set("n", "<leader>nM", "<cmd>NvimTreeClose<CR>", { desc = "Close File Tree" })
--symbolstree shortcuts
keymap.set("n", "<leader>st", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Tree" })
keymap.set("n", "<leader>sm", "<cmd>SymbolsOutlineOpen<CR>", { desc = "Open Symbols Tree" })
keymap.set("n", "<leader>sM", "<cmd>SymbolsOutlineClose<CR>", { desc = "Close Symbols Tree" })

-- telescope
keymap.set("n", "<leader>ft", "<cmd>Telescope <cr>", { desc = "List All Available Telescope Commands" }) -- Full Telescope Command List
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find Files in CWD" }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy Find String in CWD" }) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy Find String Under Cursor" }) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = " list open buffers in current neovim instance" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = " list available help tags" }) -- list available help tags
keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = " list frecency projects" }) -- list frecency projects
keymap.set("n", "<leader>fm", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = " list frecency projects" }) -- list frecency projects
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume Last Open Selector" }) -- list frecency projects
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Open List of oldfiles" }) -- list oldfiles from vim.info
keymap.set("n", "<leader>fn", "<cmd>Noice telescope<cr>", { desc = "Open Noice" }) -- Show Noice Outputs in Telescope picker

-- telescope git commands (not on youtube nvim video)
keymap.set(
	"n",
	"<leader>gc",
	"<cmd>Telescope git_commits<cr>",
	{ desc = ' list all git commits (use <cr> to checkout) ["gc" for git commits]' }
) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set(
-- 	"n",
-- 	"<leader>gfc",
-- 	"<cmd>Telescope git_bcommits<cr>",
-- 	{ desc = ' list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]' }
-- ) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set(
	"n",
	"<leader>gB",
	"<cmd>Telescope git_branches<cr>",
	{ desc = ' list git branches (use <cr> to checkout) ["gb" for git branch]' }
) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set(
	"n",
	"<leader>gs",
	"<cmd>Telescope git_status<cr>",
	{ desc = ' list current changes per file with diff preview ["gs" for git status]' }
) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = " mapping to restart lsp if necessary" }) -- mapping to restart lsp if necessary

-- color picker keymaps
keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })

function Toggle_term_cmd(term_details)
	-- if a command string is provided, create a basic table for Terminal:new() options
	if type(term_details) == "string" then
		term_details = { cmd = term_details, hidden = true }
	end
	-- use the command as the key for the table
	local term_key = term_details.cmd
	-- set the count in the term details
	if vim.v.count > 0 and term_details.count == nil then
		term_details.count = vim.v.count
		term_key = term_key .. vim.v.count
	end
	-- if terminal doesn't exist yet, create it
	-- if astronvim.user_terminals[term_key] == nil then
	--   astronvim.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
	-- end
	-- -- toggle the terminal
	-- astronvim.user_terminals[term_key]:toggle()
end
-- toggleterm
function config.toggle_term_cmd(term_details)
	-- if a command string is provided, create a basic table for Terminal:new() options
	if type(term_details) == "string" then
		term_details = { cmd = term_details, hidden = true }
	end
	-- use the command as the key for the table
	local term_key = term_details.cmd
	-- set the count in the term details
	if vim.v.count > 0 and term_details.count == nil then
		term_details.count = vim.v.count
		term_key = term_key .. vim.v.count
	end
	-- if terminal doesn't exist yet, create it
	if config.user_terminals[term_key] == nil then
		config.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
	end
	-- toggle the terminal
	config.user_terminals[term_key]:toggle()
end

keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal Split" })
keymap.set("n", "<leader>tn", function()
	config.toggle_term_cmd("node")
end, { desc = "Toggle Node Terminal" })
keymap.set("n", "<leader>tg", function()
	config.toggle_term_cmd("lazygit")
end, { desc = "Toggle LazyGit" })

function _G.set_terminal_keymaps()
	local term_opts = { buffer = 0 }
	keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
	keymap.set("t", "JK", [[<C-\><C-n>]], term_opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

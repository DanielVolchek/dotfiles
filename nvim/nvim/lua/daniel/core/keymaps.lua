vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Hide Search Highlights" })
keymap.set("n", "x", '"_x')
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")

-- buffers
keymap.set("n", "<leader>bb", ":bnext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bn", ":bprevious<CR>", { desc = "Previous Buffer" })
-- keymap.set("n", "<leader>bX", ":bd!<CR>", { desc = "Delete Buffer" })jkj

keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>", { desc = "Delete Buffer" })
keymap.set("n", "<leader>bD", ":bd!<CR>", { desc = "Delete Buffer" })

-- splits
-- keymap.set("n", "<leader>s_", "<C-w>v", { desc = "Split Vertically" }) -- split vertical
-- keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split Horizontally" }) -- split horizontal
-- -- resize splits
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split Equal Width" }) -- split equal width
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Maximize Current Split" }) -- toggle split window maximization
-- -- rotate split
-- keymap.set("n", "<leader>sr", "<C-w>x", { desc = "Rotate Split" }) -- rotate split
-- -- resize splits
-- keymap.set("n", "<leader>sj", "<C-w><", { desc = "Decrease Split Width" }) -- decrease split width
-- keymap.set("n", "<leader>sk", "<C-w>>", { desc = "Decrease Split Width" }) -- decrease split width
--
-- keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split" }) -- close split
--
-- splits
-- keymap.set("n", "<C-w>+", "<C-w> 5 +", { desc = "Increase Height by 5 units" })
-- keymap.set("n", "<C-w>-", "<C-w> 5 -", { desc = "Decrease Height by 5 units" })
-- keymap.set("n", "<C-w>>", "<C-w> 5 >", { desc = "Increase Width by 5 units" })
-- keymap.set("n", "<C-w><", "<C-w> 5 <", { desc = "Decrease Width by 5 units" })
keymap.set("n", "<C-w>m", ":MaximizerToggle<CR>", { desc = "Maximize Current Split" })

--tabs (only useful without barbar)
-- keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open New Tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab" }) -- close current tab
-- keymap.set("n", "<leader>tf", ":tabn<CR>", { desc = "Go To Next Tab" }) --  go to next tab
-- keymap.set("n", "<leader>tb", ":tabp<CR>", { desc = "Go To Previous Tab" }) --  go to previous tab

-- fix indentation
keymap.set("n", "<leader>==", "gg=G<C-o>", { desc = "Fix Indentation In File" }) --  go to previous tab

--tree shortcuts
keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { silent = true, noremap = true, desc = "Toggle File Tree" })
keymap.set("n", "<leader>nm", ":NvimTreeOpen<CR>", { desc = "Open File Tree" })
keymap.set("n", "<leader>nM", ":NvimTreeClose<CR>", { desc = "Close File Tree" })

-- telescope
keymap.set("n", "<leader>ft", "<cmd>Telescope <cr>", { desc = "List All Available Telescope Commands" }) -- Full Telescope Command List
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find Files in CWD" }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy Find String in CWD" }) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy Find String Under Cursor" }) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = " list open buffers in current neovim instance" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = " list available help tags" }) -- list available help tags
keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = " list frecency projects" }) -- list frecency projects
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = " list frecency projects" }) -- list frecency projects
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume Last Open Selector" }) -- list frecency projects

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
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = " mapping to restart lsp if necessary" }) -- mapping to restart lsp if necessary

-- color picker keymaps
keymap.set("n", "<leader>cp", ":CccPick<CR>", { desc = "Color Picker" })

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
	keymap.set("t", "jk", [[<C-\><C-n>]], term_opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

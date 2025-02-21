local opt = vim.opt

-- line nums
opt.relativenumber = true
opt.number = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
-- opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard to system by default
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true

-- kebab case as one word
opt.iskeyword:append("-")
opt.cmdheight = 1

-- persist undo after closing
opt.undofile = true

-- opt.cmdheight = 0

-- Set HAR filetype
vim.api.nvim_exec(
	[[
  autocmd BufNewFile,BufRead *.har set filetype=har
]],
	false
)

-- disable comment continuation
-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

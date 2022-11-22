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

-- clipboard to system by defualt
-- opt.cliboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true

-- kebab case as one word
opt.iskeyword:append("-")
opt.cmdheight = 1

-- persist undo after closing
opt.undofile = true

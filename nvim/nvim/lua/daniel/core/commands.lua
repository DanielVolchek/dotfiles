vim.cmd("command EditConfig e ~/.config/nvim/init.lua")
vim.cmd("command EditConf e ~/.config/nvim/init.lua")

vim.cmd("command Dash :Dashboard")
vim.cmd("command CDCurrentLocal :lcd %:p:h")
vim.cmd("command CDCurrentGlobal :lcd %:p:h")
vim.cmd("command SetRegA :lua vim.notify(vim.inspect(vim.fn.getreg('a')))")

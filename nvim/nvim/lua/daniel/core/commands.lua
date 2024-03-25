P = function(v)
	print(vim.inspect(v))
	return v
end

vim.cmd("command EditConfig e ~/.config/nvim/init.lua")
vim.cmd("command EditConf e ~/.config/nvim/init.lua")

vim.cmd("command Dash Dashboard")
vim.cmd("command CD lcd %:p:h")
vim.cmd("command Diff :w !diff % -")
vim.cmd("command FullPath :!echo % | pbcopy")

vim.cmd("command SplitCount :lua P(#vim.api.nvim_tabpage_list_wins(0))")

vim.cmd("command NoRoot :lua config.rootSearch = false")

-- vim.cmd("command CDCurrentGlobal lcd %:p:h")

--vim.cmd("command OpenObsidian e " .. config.obsidianDir)

-- local group = vim.api.nvim_create_augroup("cmdlinesize", { clear = true })

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
-- 	callback = function()
-- 		vim.o.cmdheight = 1
-- 	end,
-- 	group = group,
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
-- 	callback = function()
-- 		-- todo change back
-- 		vim.o.cmdheight = 1
-- 	end,
-- 	group = group,
-- })
--
--

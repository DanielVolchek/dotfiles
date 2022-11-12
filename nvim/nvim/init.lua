_G.config = {}
config.plugindir = "daniel.plugins."
config.user_terminals = {}
config.verbose = true
config.log = function(...)
	if config.verbose then
		vim.notify(...)
	end
end

-- setup
require("daniel.plugins-setup")

-- call notify first so that it can be used in other configs if needed
-- require("daniel.plugins.notify")
-- require("daniel.plugins.noice")

--core
require("daniel.core.options") -- opts
require("daniel.core.keymaps") -- keymaps
require("daniel.core.colorscheme") -- colorscheme
require("daniel.core.commands") -- self-defined commands

-- load plugins
local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")
for _, file in ipairs(files) do
	--	why lua no have continue D:
	if file ~= "README.md" then
		config.log("Sourcing " .. file)
		local status, ok = pcall(require, config.plugindir .. file)
		if not status then
			vim.notify("Failed to load plugin " .. file .. ok)
		end
	end
end

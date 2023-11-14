-- Loads plugins from this directory
local sourcedir = function(dir)
	if not dir then
		vim.notify("Error: Please provide directory to sourcedir function")
		return
	end
	local files = vim.fn.readdir(dir)

	local plugins = {}

	for _, file in ipairs(files) do
		if file ~= "init.lua" then
			-- if file ~= "lsp" then
			-- if i < plugincount / 2 then
			config.log("Sourcing " .. file)
			local status, ok = pcall(require, config.plugindir .. file)
			if status then
				table.insert(plugins, status)
			else
				vim.notify("Failed to load plugin " .. file .. ok)
				config.log("Error: " .. ok)
			end
		end
	end
	return plugins
end

-- LazyVim setup file
-- Load all plugins
local plugins = sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")
return plugins

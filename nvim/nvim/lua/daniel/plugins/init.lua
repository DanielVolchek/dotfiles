-- Loads plugins from this directory
local sourcedir = function(dir)
	if not dir then
		vim.notify("Error: Please provide directory to sourcedir function")
		return
	end
	local files = vim.fn.readdir(dir)

	local plugins = {}

	print("In sourcedir")

	for _, file in ipairs(files) do
		config.log("sourcing file " .. file)

		if file ~= "init.lua" then
			-- if file ~= "lsp" then
			-- if i < plugincount / 2 then
			local status, plugin = pcall(require, config.plugindir .. file)
			if status then
				if plugin ~= true then
					table.insert(plugins, plugin)
				end
			else
				vim.notify("Failed to load plugin " .. file .. plugin)
				config.log("Error: " .. plugin)
			end
		end
	end

	return plugins
end

-- LazyVim setup file
-- Load all plugins
local plugins = sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

for i, pl in ipairs(plugins) do
	if pl == true then
		P("pl is true")
	end
end

return plugins

config.log = function(...)
	if config.verbose then
		vim.notify(...)
	end
end

config.sourcedir = function(dir)
	if not dir then
		vim.notify("Error: Please provide directory to sourcedir function")
		return
	end
	local files = vim.fn.readdir(dir)
	for _, file in ipairs(files) do
		--	why lua no have continue D:
		if file ~= "README.md" then
			config.log("Sourcing " .. file)
			local status, ok = pcall(require, config.plugindir .. file)
			if not status then
				vim.notify("Failed to load plugin " .. file .. ok)
				config.log("Error: " .. ok)
			end
		end
	end
end
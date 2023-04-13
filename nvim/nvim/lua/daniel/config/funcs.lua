_G.config = _G.config or {}

config.log = function(...)
	if config.verbose then
		vim.notify(...)
	end
end

-- source files (probably need to change how this works for lazy.nvim)
config.sourcedir = function(dir)
	if not dir then
		vim.notify("Error: Please provide directory to sourcedir function")
		return
	end
	local files = vim.fn.readdir(dir)
	local plugincount = 28

	for i, file in ipairs(files) do
		if file ~= "README.md" then
			-- if file ~= "lsp" then
			-- if i < plugincount / 2 then
			config.log("Sourcing " .. file)
			local status, ok = pcall(require, config.plugindir .. file)
			if not status then
				vim.notify("Failed to load plugin " .. file .. ok)
				config.log("Error: " .. ok)
			end
			-- end
		end
	end
end

config.searchWithoutJump = function(dir)
	vim.cmd(string.format("normal! %s", dir))
	local count = vim.fn.searchcount().total
	if count > 1 then
		vim.cmd("normal! ")
	end
end

config.getDay = function()
	-- get date
	local date = vim.fn.strftime("%c")
	-- split by space and get first element
	return vim.split(date, " ", { plain = true })[1]
end

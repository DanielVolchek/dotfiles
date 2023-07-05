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

config.hasArg = function(arg)
	for _, value in ipairs(vim.v.argv) do
		if value == arg then
			return true
		end
	end
	return false
end

local function searchFileInCurrentDirectory(filename)
	local currentDir = vim.fn.getcwd()
	local success, files = pcall(vim.loop.fs_scandir, currentDir)
	if not success then
		print("Failed to scan current directory.")
		return
	end

	while true do
		local file = vim.loop.fs_scandir_next(files)
		if file == nil then
			break
		end

		if file == ".nvimroot" then
			return true
		end
	end

	return false
end

local goUpAndSetToRoot = function()
	local currentDir = vim.fn.getcwd()

	if currentDir == "/" then
		return false
	end

	local parentDir = vim.fn.fnamemodify(currentDir, ":h")

	vim.cmd("cd " .. parentDir)

	return true
end

-- Example usage
config.getRoot = function()
	if not config.rootSearch then
		return
	end

	local originalPath = vim.fn.getcwd()

	local maxSearchDepth = config.rootMaxDepth

	local iterations = 0
	local whileLoopCondition = true

	while whileLoopCondition do
		if maxSearchDepth then
			whileLoopCondition = iterations < maxSearchDepth
		else
			whileLoopCondition = true
		end

		local found = searchFileInCurrentDirectory(".nvimroot")

		if not found then
			local moved = goUpAndSetToRoot()
			if not moved then
				vim.cmd("cd " .. originalPath)
				break
			end
		else
			break
		end
	end
end

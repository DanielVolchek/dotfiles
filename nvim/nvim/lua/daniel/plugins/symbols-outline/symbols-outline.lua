local status, symbols_outline = pcall(require, "symbols-outline")
if not status then
	print("Error loading symbols_outline")
	return
end

symbols_outline.setup(opts)

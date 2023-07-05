local ok, spectre = pcall(require, "spectre")
if not ok then
	P("Spectre could not be loaded")
	return
end

spectre.setup({})

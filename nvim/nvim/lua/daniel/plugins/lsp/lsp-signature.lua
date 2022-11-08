local status, signature = pcall(require, "lsp_signature")
if not status then
	return
end

local opts = {}
signature.setup(opts)

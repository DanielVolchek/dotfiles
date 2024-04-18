local plugindir = config.plugindir .. "lsp."

local mason = require(plugindir .. "mason")
local null = require(plugindir .. "null-ls")
local conf = require(plugindir .. "lspconfig")
local saga = require(plugindir .. "lspsaga")

return {
	mason,
	null,
	conf,
	saga,
}

if not _G.initDash then
	-- necessary because dashboard has to load in packer config meaning in the source function we need to return
	return
end
local plugindir = config.plugindir .. "dashboard."
require(plugindir .. "dashboard")
_G.initDash = false

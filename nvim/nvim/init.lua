-- setup
require("daniel.plugins-setup")

-- load config
require("daniel.config")

--load core
require("daniel.core")

-- load plugins
config.sourcedir(vim.fn.stdpath("config") .. "/lua/daniel/plugins")

--load maps
-- config.loadmaps(config.maps)
--

local gfs = require("gears.filesystem")

local lock_screen = {}

local config_dir = gfs.get_configuration_dir()
package.cpath = package.cpath .. ";" .. config_dir .. "mods/?.so;"

lock_screen.init = function()
	require("layout.lockscreen.lock")
end

return lock_screen


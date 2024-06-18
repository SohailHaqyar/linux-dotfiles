-- titlebar
-- ~~~~~~~~


-- requirements
-- ~~~~~~~~~~~~
local awful     = require("awful")
local beautiful = require("beautiful")
local dpi           = beautiful.xresources.apply_dpi
local wibox     = require("wibox")
local helpers   = require("helpers")
local gears     = require("gears")





-- misc/vars
-- ~~~~~~~~~~

-- function to create those buttons
local function create_button(shape, color, command, c)

  -- the widget
  local w = wibox.widget{
    widget = wibox.container.background,
    bg = color or beautiful.accent,
    shape = shape or helpers.prrect(beautiful.rounded, true, true, false, true),
    forced_width = dpi(15),
    forced_height = dpi(15)
  }


  -- hover effect
  w:connect_signal('mouse::enter', function ()
    w.bg = beautiful.accent
  end)

  w:connect_signal('mouse::leave', function ()
    w.bg = beautiful.fg_color .. "4D"
  end)

  -- press effect
  w:connect_signal('button::press', function ()
    w.bg = beautiful.fg_color .. "99"
  end)

  w:connect_signal('button::release', function ()
    w.bg = beautiful.accent
  end)
                

  -- dynamic color
  local function dyna()
    if client.focus == c then
      w.bg = beautiful.fg_color .. "4D"
    else
      w.bg = beautiful.fg_color .. "1A"
    end
  end

  -- apply dynamic color
  c:connect_signal("focus",dyna)

  c:connect_signal("unfocus", dyna)


  -- button action
  w:buttons(gears.table.join(
  awful.button({ }, 1, command)))

  return w

end







-- init
-- ~~~~

-- connect to titlebar signal

-- exra
-- ~~~~
require("layout.decorations.music")

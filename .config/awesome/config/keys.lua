-- keybinds haha
-- ~~~~~~~~~~~~~

local revelation = require("revelation")

-- requirements
-- ~~~~~~~~~~~~
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local lmachi = require("mods.layout-machi")
require("layout.lockscreen").init()

-- vars/misc
-- ~~~~~~~~~

-- modkey
local modkey = "Mod4"
-- modifer keys
local shift = "Shift"
local ctrl = "Control"
local altkey = "Mod1"

-- Configurations
-- ~~~~~~~~~~~~~~

-- mouse keybindings
awful.mouse.append_global_mousebindings({
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})

-- launchers
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "e", revelation),
	awful.key({ modkey }, "Return", function()
		awful.spawn(user_likes.term)
	end, { description = "open terminal", group = "launcher" }),

	awful.key({ modkey }, "s", function()
		awful.spawn(user_likes.music)
	end, { description = "launch music client", group = "launcher" }),

	awful.key({ modkey }, "b", function()
		awful.spawn.with_shell(user_likes.web)
	end, { description = "open web browser", group = "launcher" }),

	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn("rofi -show drun")
	end, { description = "Open rofi", group = "launcher" }),

	awful.key({ modkey }, "r", function()
		awful.spawn(home_var .. "/.scripts/picker", false)
	end, { description = "exec color picker", group = "launcher" }),

	awful.key({ modkey }, "a", function()
		cc_toggle(screen.primary)
	end, { description = "toggle control center", group = "launcher" }),

	-- awful.key({ modkey }, "d", function()
	--        lock_screen_show()
	-- end,
	--    { description = "show lockscreen", group = "launcher" }),
})

-- control/media
awful.keyboard.append_global_keybindings({
	-- Player
	awful.key({ modkey, altkey }, "Right", function()
		awful.spawn.with_shell("playerctl next")
	end, { description = "Player Next", group = "misc" }),

	awful.key({ modkey, altkey }, "Left", function()
		awful.spawn.with_shell("playerctl previous")
	end, { description = "Player Previous ", group = "misc" }),

	awful.key({ modkey, altkey }, "p", function()
		awful.spawn.with_shell("playerctl play-pause")
	end, { description = "Player Play-Pause", group = "misc" }),

	awful.key({ modkey, altkey }, "Up", function()
		awful.spawn.with_shell("/home/kaka_sohail/scripts/volume-up.sh")
	end, { description = "Volume up", group = "misc" }),

	awful.key({ modkey, altkey }, "Down", function()
		awful.spawn.with_shell("/home/kaka_sohail/scripts/volume-down.sh")
	end, { description = "Volume down", group = "misc" }),

	-- toggle touchpad
	awful.key({ modkey, altkey }, "t", function()
		awful.spawn.with_shell("/home/kaka_sohail/scripts/disable-touchpad.sh")
	end, { description = "Toggle Touchpad", group = "misc" }),
})

-- awesome yeah!
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "F1", hotkeys_popup.show_help, { description = "show this help window", group = "awesome" }),
	awful.key({ modkey, ctrl }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, shift }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "v", function()
		require("mods.exit-screen")
		awesome.emit_signal("module::exit_screen:show")
	end, { description = "show exit screen", group = "modules" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tags" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, {
		description = "focus previous by index",
		group = "client",
	}),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),
	awful.key({ "Shift", "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ "Shift", "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, {
		description = "focus the previous screen",
		group = "screen",
	}),

	awful.key({ modkey }, "Tab", function()
		awesome.emit_signal("bling::window_switcher::turn_on")
	end, { description = "window switcher", group = "client" }),

	awful.key({ modkey, ctrl }, "n", function()
		local c = awful.client.restore()
		if c then
			c:activate({ raise = true, context = "key.unminimize" })
		end
	end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, shift }, "d", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	awful.key({ modkey, shift }, "a", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),

	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	awful.key({ modkey, shift }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),

	awful.key({ modkey, shift }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),

	awful.key({ modkey, ctrl }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ modkey, ctrl }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	awful.key({ modkey, shift }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	-- layout machi
	awful.key({ modkey }, ".", function()
		lmachi.default_editor.start_interactive()
	end, { description = "edit current layout", group = "layout" }),

	awful.key({ modkey, shift }, ".", function()
		lmachi.switcher.start(client.focus)
	end, { description = "switch between windows for a machi layout", group = "layout" }),
})

-- tag related keys
awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, ctrl },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, shift },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, ctrl, shift },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),

	awful.key({
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function(index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	}),
})

-- mouse mgmt
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({

		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),

		awful.button({ modkey }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),

		awful.button({ modkey }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

-- client mgmt
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),

		awful.key({ ctrl, shift }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),

		awful.key({ modkey }, "x", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),

		awful.key({ modkey, ctrl }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),

		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),

		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),

		awful.key({ modkey }, "n", function(c)
			c.minimized = true
		end, { description = "minimize", group = "client" }),

		awful.key({ modkey }, "z", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
	})
end)

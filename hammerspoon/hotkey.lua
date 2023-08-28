local hotkey = require "hs.hotkey"
local fnutils = require "hs.fnutils"
-- local spaces = require "hs.spaces"

-- Halves of the screen
hotkey.bind({"ctrl","cmd"}, "h", fnutils.partial(winResize, "left"))
hotkey.bind({"ctrl","cmd"}, "l", fnutils.partial(winResize, "right"))
hotkey.bind({"ctrl","cmd"}, "j", fnutils.partial(winResize, "up"))
hotkey.bind({"ctrl","cmd"}, "k", fnutils.partial(winResize, "down"))

-- Center of the screen
hotkey.bind({"ctrl", "cmd"}, "c", winCenter)

-- Thirds of the screen
-- hotkey.bind({"ctrl", "alt"}, "h", winLeftThird)
-- hotkey.bind({"ctrl", "alt"}, "l", winRightThird)
-- hotkey.bind({"ctrl", "alt"}, "j", winUpThird)
-- hotkey.bind({"ctrl", "alt"}, "k", winDownThird)

-- Maximized
hotkey.bind({"ctrl", "cmd"}, "f", fnutils.partial(winResize, "max"))
hotkey.bind({"ctrl", "cmd"}, "t", fnutils.partial(winToggleMaximized))

-- Move between spaces
for k, v in ipairs(getUserSpaceIds()) do
  hotkey.bind({"ctrl"}, tostring(k), fnutils.partial(gotoSpace, v))
  hotkey.bind({"ctrl", "cmd"}, tostring(k), fnutils.partial(moveWinToSpace, v, true))
  hotkey.bind({"ctrl", "alt"}, tostring(k), fnutils.partial(moveWinToSpace, v, false))
end

-- Move between screens
hotkey.bind({"ctrl", "alt"}, "Left", fnutils.partial(winMoveScreen, "left"))
hotkey.bind({"ctrl", "alt"}, "Right", fnutils.partial(winMoveScreen, "right"))

-- Mission Control
-- hotkey.bind({"ctrl"}, "m", fnutils.partial(spaces.openMissionControl))
-- hotkey.bind({"ctrl", "alt"}, "m", fnutils.partial(spaces.closeMissionControl))

-- Launch app
-- hotkey.bind({"ctrl", "cmd"}, "e", fnutils.partial(launchApp, "Emacs"))
hotkey.bind({"ctrl", "cmd"}, "e", fnutils.partial(openEmacsClient))

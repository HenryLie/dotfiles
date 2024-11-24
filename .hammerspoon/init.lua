-- highlight active window
hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = { 0, 0, 0, 0.2 }
wf = hs.window.filter.new()
wf:subscribe(hs.window.filter.windowFocused, function()
	hs.window.highlight.start(nil, wf)
end)

-- border around active window
local highlight = nil

local function highlightWindow()
	-- Clear any existing highlight
	if highlight then
		highlight:delete()
		highlight = nil
	end

	-- Get the currently focused window
	local win = hs.window.focusedWindow()
	if not win then
		return
	end

	-- Get the frame of the focused window
	local frame = win:frame()

	-- Create a new rectangle that slightly expands beyond the window's bounds
	local borderWidth = 8 -- Width of the border
	local highlightFrame = hs.geometry.rect(
		frame.x - (borderWidth / 2),
		frame.y - (borderWidth / 2),
		frame.w + borderWidth,
		frame.h + borderWidth
	)

	-- Create the highlight rectangle
	highlight = hs.drawing.rectangle(highlightFrame)
	highlight:setStrokeColor({ ["red"] = 1, ["green"] = 0.7, ["blue"] = 0, ["alpha"] = 0.8 })
	highlight:setStrokeWidth(borderWidth)
	highlight:setFill(false)
	highlight:setRoundedRectRadii(10, 10) -- Optional: rounded corners
	highlight:bringToFront(true) -- Ensure it's visible on top of the window
	highlight:show()
end

-- Bind the function to a hotkey (e.g., Ctrl + Alt + H)
-- hs.hotkey.bind({"ctrl", "alt"}, "H", highlightWindow)

-- Automatically remove the highlight when the focus changes
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function()
	highlightWindow()
end)

hs.window.filter.default:subscribe(hs.window.filter.windowUnfocused, function()
	if highlight then
		highlight:delete()
		highlight = nil
	end
end)

-- alt-tab to switch between windows
hs.window.switcher.ui.showThumbnails = true
hs.window.switcher.ui.showSelectedThumbnail = false
hs.window.switcher.ui.titleBackgroundColor = { 0, 0, 0, 0 }
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter({})) -- include minimized/hidden windows, current Space only
hs.hotkey.bind("alt", "tab", nil, function()
	switcher_space:next()
end)
hs.hotkey.bind("alt-shift", "tab", nil, function()
	switcher_space:previous()
end)

-- expose = hs.expose.new(nil, {
--     showThumbnails = false
-- }) -- default windowfilter, no thumbnails

-- hs.hotkey.bind('ctrl-cmd', 'up', 'Expose', function()
--     expose:toggleShow()
-- end)

detectMouseDown = hs.eventtap.new({
	hs.eventtap.event.types.otherMouseDown,
	hs.eventtap.event.types.leftMouseDown,
	hs.eventtap.event.types.rightMouseDown,
	hs.eventtap.event.types.scrollWheel,
}, function(e)
	local button = e:getProperty(hs.eventtap.event.properties["mouseEventButtonNumber"])
	local wheel = e:getProperty(hs.eventtap.event.properties["scrollWheelEventDeltaAxis1"])

	-- print(hs.inspect(hs.eventtap.checkKeyboardModifiers()))
	modifiers = hs.eventtap.checkKeyboardModifiers()
	isCmdHeld = modifiers.cmd == true
	isCtrlHeld = modifiers.ctrl == true
	isAltHeld = modifiers.alt == true

	isWheelDown = wheel < 0
	isWheelUp = wheel > 0

	isLeftPressed = button == 0
	isRightPressed = button == 1
	isMiddlePressed = button == 2
	isBackPressed = button == 3
	isForwardPressed = button == 4

	isLeftHeld = e:getButtonState(0)
	isRightHeld = e:getButtonState(1)
	isMiddleHeld = e:getButtonState(2)
	isBackHeld = e:getButtonState(3)
	isForwardHeld = e:getButtonState(4)
	isBackForwardHeld = isBackHeld and isForwardHeld

	if isBackPressed then
		if isForwardHeld then
			return false
		end
		return true
	end
	if isForwardPressed then
		return true
	end

	if isWheelDown or isWheelUp then
		if isBackForwardHeld then
			if isWheelUp then
				-- hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
				hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, true):post()
				hs.eventtap.event.newKeyEvent("tab", true):post()
				hs.eventtap.event.newKeyEvent("tab", false):post()
				hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, false):post()
				-- hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			else
				-- hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
				hs.eventtap.event.newKeyEvent("tab", true):post()
				hs.eventtap.event.newKeyEvent("tab", false):post()
				-- hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			end
			return true
		elseif isBackHeld or isCtrlHeld then
			if isWheelUp then
				hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
				hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
			else
				hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
				hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
			end
			return true
		elseif isForwardHeld then
			hs.eventtap.event.newScrollEvent({ -wheel, 0 }, {}, "line"):post()
			return true
		end
	end

	if isLeftPressed then
		if isBackForwardHeld then
			print("back forward left")
		elseif isBackHeld or isRightHeld then
			hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
			hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
			return true
		elseif isForwardHeld then
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
			hs.eventtap.event.newKeyEvent("left", true):post()
			hs.eventtap.event.newKeyEvent("left", false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
			return true
		end
	end

	if isRightPressed then
		if isBackForwardHeld then
		elseif isBackHeld or isLeftHeld then
			hs.eventtap.otherClick(hs.mouse.absolutePosition(), 200000, 3)
			return true
		elseif isForwardHeld then
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
			hs.eventtap.event.newKeyEvent("right", true):post()
			hs.eventtap.event.newKeyEvent("right", false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
			return true
		end
	end

	if isMiddlePressed then
		if isBackForwardHeld then
			print("back forward left")
		elseif isBackHeld then
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
			hs.eventtap.event.newKeyEvent("down", true):post()
			hs.eventtap.event.newKeyEvent("down", false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
			return true
		elseif isForwardHeld then
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
			hs.eventtap.event.newKeyEvent("up", true):post()
			hs.eventtap.event.newKeyEvent("up", false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
			hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
			return true
		end
	end
end)

detectMouseDown:start()

function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

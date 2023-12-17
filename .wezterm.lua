-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.window_background_opacity = 0.75
config.enable_tab_bar = false
config.freetype_load_target = "Light"
config.freetype_render_target = "Normal"
config.freetype_load_flags = "NO_HINTING"
config.font = wezterm.font_with_fallback({ "LigaHack Nerd Font", { family = "Noto Sans JP" } })
config.font_size = 10
config.front_end = "WebGpu"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config

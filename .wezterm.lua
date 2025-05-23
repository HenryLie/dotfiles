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
config.window_close_confirmation = "NeverPrompt"

config.window_background_opacity = 0.75
config.enable_tab_bar = false
config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"
config.font = wezterm.font_with_fallback({ "LigaHack Nerd Font", { family = "Noto Sans JP" } })
config.font_size = 9
config.cell_width = 0.9
config.front_end = "WebGpu"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.max_fps = 120
config.animation_fps = 30

if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 10
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:kali-linux"
	config.front_end = "OpenGL"
	config.freetype_load_flags = "DEFAULT"
end

-- and finally, return the configuration to wezterm
return config

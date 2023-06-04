-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 20

config.font = wezterm.font_with_fallback({
	"CaskaydiaCove Nerd Font",
	"Monospace",
})
-- For example, changing the color scheme:
-- config.color_scheme = "Hacktober"

config.window_background_opacity = 0.9

config.default_prog = { "/bin/zsh" }

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
return config

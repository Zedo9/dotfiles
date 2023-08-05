-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 19

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Monospace",
})
-- For example, changing the color scheme:
-- config.color_scheme = "Hacktober"

config.window_background_opacity = 0.85

config.color_scheme = 'iTerm2 Default'
-- config.color_scheme = 'Windows NT (base16)'
config.default_prog = { "/bin/zsh" }

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
return config

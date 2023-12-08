local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 15
config.term = "wezterm"

config.font = wezterm.font("Cascadia Code", { weight = 450 })
-- config.font = wezterm.font("Monaco", { weight = 600 })
-- config.font = wezterm.font("Monaspace Radon", { weight = 500 })

config.window_background_opacity = 0.8
config.default_prog = { "/bin/zsh" }
config.color_scheme = "Dark Pastel"
config.tab_bar_at_bottom = true

config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

return config

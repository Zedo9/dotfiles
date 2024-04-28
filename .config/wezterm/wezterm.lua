local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.warn_about_missing_glyphs = true
config.freetype_load_target = "Normal" -- https://wezfurlong.org/wezterm/config/lua/config/freetype_load_target.html
config.font_size = 15
config.term = "wezterm"

config.front_end = "OpenGL"

local family = "Monaspace Argon"
local default_weight = 400

config.font = wezterm.font({
	family = family,
	weight = default_weight,
})

config.font_rules = {
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = family,
			weight = default_weight,
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = family,
			weight = "ExtraBold",
			style = "Normal",
		}),
	},
}

-- config.font = wezterm.font({
-- 	family = "Monaspace Radon", -- Radon, Xenon, Krypton, Argon, Neon
-- 	weight = 500,
-- 	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
-- })

-- config.font = wezterm.font({
-- 	family = "Monaco",
-- 	weight = 600,
-- })

config.window_background_opacity = 0.85
config.default_prog = { "/bin/zsh" }
config.color_scheme = "Dark Pastel"
config.tab_bar_at_bottom = true

config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	-- Make Option-Right equivalent to Alt-f; forward-word
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
}

config.window_padding = {
	left = 1,
	right = 1,
	top = 0,
	bottom = 0,
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

return config

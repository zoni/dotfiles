local wezterm = require 'wezterm'
local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.check_for_updates = false
config.term = "wezterm"

config.window_close_confirmation = 'NeverPrompt'
config.warn_about_missing_glyphs = false
config.hide_tab_bar_if_only_one_tab = true

config.font_size = 12.0
config.font = wezterm.font_with_fallback({
  "Ubuntu Mono derivative Powerline",
  "Noto Color Emoji",
  "Symbols Nerd Font Mono",
  "Symbola",
  "Last Resort High-Efficiency",
})

config.window_background_opacity = 0.8
config.color_scheme = "OneDark"
config.colors = {
    scrollbar_thumb = '#333333',
}

config.enable_scroll_bar = true
config.min_scroll_bar_height = "1.5cell"
config.scrollback_lines = 20000

return config

local wezterm = require 'wezterm'

return {
  check_for_updates = false,
  color_scheme = "OneDark",
  font = wezterm.font_with_fallback({
    "Ubuntu Mono derivative Powerline",
    "Noto Color Emoji",
    "Symbols Nerd Font Mono",
    "Symbola",
    "Last Resort High-Efficiency",
  }),
  font_size = 12.0,
  hide_tab_bar_if_only_one_tab = true,
  scrollback_lines = 20000,
  term = "wezterm",
  window_background_opacity = 0.8,
  window_close_confirmation = 'NeverPrompt',
}

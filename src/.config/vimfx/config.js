let options = {
  "prevent_autofocus": true,
  "hints.chars": "fjdkslaghrueiwonc qpmv",
  "prev_patterns": "prev  previous  ‹  «  ◀  ←  <<  <  back  newer  vorige",
  "next_patterns": "next  ›  »  ▶  →  >>  >  more  older  vorige",
  "mode.normal.history_back": "<c-o>",
  "mode.normal.history_forward": "<c-i>",
  "mode.normal.scroll_half_page_down": "",
  "mode.normal.scroll_half_page_up": "",
  "mode.normal.tab_select_previous": "K    gT  <c-p>",
  "mode.normal.tab_select_next": "J    gt  <c-n>",
  "mode.normal.tab_close": "d",
  "mode.normal.tab_restore": "u",
  "mode.normal.tab_close_to_end": "gd$",
  "mode.normal.tab_close_other": "gda"
}
Object.entries(options).forEach(([option, value]) => vimfx.set(option, value))

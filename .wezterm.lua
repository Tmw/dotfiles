local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Spacedust (Gogh)'

config.window_padding = {
  top = 0,
  left = 0,
  right = 0,
  bottom = 0,
}

config.font_size = 18

local a = wezterm.action

config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
  -- clearing screen
  { key = 'k', mods = 'CMD', action = a.ClearScrollback('ScrollbackAndViewport') },

  -- splitting panes
  { key = 'D', mods = 'CMD', action = a.SplitVertical },
  { key = 'd', mods = 'CMD', action = a.SplitHorizontal },

  -- moving focus between panes
  { key = '[', mods = 'CMD', action = a.ActivatePaneDirection('Left') },
  { key = 'h', mods = 'OPT', action = a.ActivatePaneDirection('Left') },

  { key = ']', mods = 'CMD', action = a.ActivatePaneDirection('Right') },
  { key = 'l', mods = 'OPT', action = a.ActivatePaneDirection('Right') },

  { key = 'k', mods = 'OPT', action = a.ActivatePaneDirection('Up') },
  { key = 'j', mods = 'OPT', action = a.ActivatePaneDirection('Down') },

  -- resizing panes
  { key = 'L', mods = 'OPT', action = a.AdjustPaneSize({ 'Right', 5 }) },
  { key = 'H', mods = 'OPT', action = a.AdjustPaneSize({ 'Left', 5 }) },
  { key = 'K', mods = 'OPT', action = a.AdjustPaneSize({ 'Up', 5 }) },
  { key = 'J', mods = 'OPT', action = a.AdjustPaneSize({ 'Down', 5 }) },

  -- jumping words on prompt
  { key = 'LeftArrow', mods = 'OPT', action = a.SendKey { key = 'b', mods = 'ALT' } },
  { key = 'RightArrow', mods = 'OPT', action = a.SendKey { key = 'f', mods = 'ALT' } },
  { key = 'Backspace', mods = 'OPT', action = a.SendKey({ key = 'w', mods = 'CTRL' }) },
}

-- use non-fancy tabbar and hide when only one tab
config.use_fancy_tab_bar = false;
config.hide_tab_bar_if_only_one_tab = true;

-- changing font size should not affect window size
config.adjust_window_size_when_changing_font_size = false

return config

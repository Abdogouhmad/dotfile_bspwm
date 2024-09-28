-- Pull in the wezterm API
local w = require 'wezterm'

-- Add the keymap directory to the package path
package.path = package.path .. ';' .. w.home_dir .. '/.config/wezterm/keymap/?.lua'

-- Import keybindings from the keymap.lua file
local keybindings = require 'keymap'

-- This will hold the configuration.
local config = w.config_builder()

config = {
  -- auto reload active
  automatically_reload_config = true,
  -- disable tab bar
  enable_tab_bar = false,
  -- padding
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- font
  font = w.font({
    family = "JetBrains Mono",
    weight = "Bold",
    italic = false,
  }),
  font_size = 10.5,
  -- cursor style
  default_cursor_style = "BlinkingBlock",
  -- color scheme
  color_scheme = "Gruvbox dark, soft (base16)",
  -- window opacity
  window_background_opacity = 0.8,
  -- keybindings
  keys = keybindings
}

-- and finally, return the configuration to wezterm
return config

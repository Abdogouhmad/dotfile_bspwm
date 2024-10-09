-- Pull in the wezterm API
local w = require 'wezterm'

-- Add the keymap directory to the package path
package.path = package.path .. ';' .. w.home_dir .. '/.config/wezterm/keymap/?.lua'
package.path = package.path .. ';' .. w.home_dir .. '/.config/wezterm/?.lua'

-- Import keybindings from the keymap.lua file
local keybindings = require 'keymap'

-- Import background configuration
-- local background = require 'background'
local CustomTabBar = require "custombar"
local PaneBar = require "PaneBar"
-- This will hold the configuration.
local config = w.config_builder()

-- Base configuration
config = {
  -- auto reload active
  automatically_reload_config = true,
  -- disable tab bar
  enable_tab_bar = true,
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
  window_background_opacity = 0.7, -- Set to 1.0 to allow background image to control opacity
  -- keybindings
  keys = keybindings
}

-- Apply background configuration if needed
-- config = background.apply_config(config)
config = CustomTabBar.apply_config(config)
config = PaneBar.apply_config(config)
-- and finally, return the configuration to wezterm
return config

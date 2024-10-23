-- Pull in the wezterm API
local w = require 'wezterm'

-- import cores 
local keybindings = require 'core.keymap'
local CustomTabBar = require "core.custombar"
local PaneBar = require "core.PaneBar"

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

-- Apply needed configurations
config = CustomTabBar.apply_config(config)
config = PaneBar.apply_config(config)
-- and finally, return the configuration to wezterm
return config

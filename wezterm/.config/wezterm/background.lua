-- background.lua
local wezterm = require 'wezterm'

local M = {}

M.apply_config = function(config)
  -- Set a single background image
  config.background = {
    {
      source = {
        File = wezterm.home_dir .. "/dotfile_bspwm/wallpapers/cub.png",
      },
      -- Stretch the image to fill the entire window
      width = "100%",
      height = "100%",
      attachment = { Parallax = 0.1 },
      -- Optionally, you can adjust the opacity of the image
      opacity = 0.3,
    },
  }

  return config
end

return M

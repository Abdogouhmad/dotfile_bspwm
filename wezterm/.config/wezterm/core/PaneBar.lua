local wezterm = require 'wezterm'

local M = {}

function M.apply_config(config)
  -- Define Gruvbox color palette
  local gruvbox_colors = {
    dark0_hard = "#1d2021",
    dark0 = "#282828",
    dark1 = "#3c3836",
    dark2 = "#504945",
    dark3 = "#665c54",
    dark4 = "#7c6f64",
    light0_hard = "#f9f5d7",
    light0 = "#fbf1c7",
    light1 = "#ebdbb2",
    light2 = "#d5c4a1",
    light3 = "#bdae93",
    light4 = "#a89984",
    bright_red = "#fb4934",
    bright_green = "#b8bb26",
    bright_yellow = "#fabd2f",
    bright_blue = "#83a598",
    bright_purple = "#d3869b",
    bright_aqua = "#8ec07c",
    bright_orange = "#fe8019",
  }


  local function tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
      return title
    end
    return tab_info.active_pane.title
  end

  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local edge_background = gruvbox_colors.dark0_hard
    local background = gruvbox_colors.dark2
    local foreground = gruvbox_colors.light4

    if tab.is_active then
      background = gruvbox_colors.bright_green
      foreground = gruvbox_colors.dark0_hard
    elseif hover then
      background = gruvbox_colors.dark3
      foreground = gruvbox_colors.light2
    else
      background = gruvbox_colors.dark0_hard
      foreground = gruvbox_colors.light3
    end

    local edge_foreground = background
    local title = tab_title(tab)

    -- Ensure titles fit in the available space
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = ' ' .. title .. ' ' },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
    }
  end)
  return config
end

return M

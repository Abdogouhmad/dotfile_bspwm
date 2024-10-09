local wezterm = require 'wezterm'

local M = {}

function M.apply_config(config)
  -- Enable fancy tab bar settings
  config.use_fancy_tab_bar = false
  config.status_update_interval = 1000
  config.tab_bar_at_bottom = true
  config.default_workspace = "bspwm"

  wezterm.on("update-status", function(window, pane)
    -- Workspace name
    local stat = window:active_workspace()
    local stat_color = "#B8BB26"

    -- Display active key table or leader status
    if window:active_key_table() then
      stat = window:active_key_table()
      stat_color = "#7dcfff"
    end
    if window:leader_is_active() then
      stat = "LDR"
      stat_color = "#bb9af7"
    end

    -- Helper function to get basename from a path
    local function basename(s)
      return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end

    -- Get the current working directory
    local cwd = pane:get_current_working_dir()
    if cwd then
      if type(cwd) == "userdata" then
        cwd = basename(cwd.file_path)
      else
        cwd = basename(cwd)
      end
    else
      cwd = ""
    end

    -- Get the current foreground command
    local cmd = pane:get_foreground_process_name()
    cmd = cmd and basename(cmd) or ""

    -- battery info
    local bat = ''
    for _, b in ipairs(wezterm.battery_info()) do
      bat = string.format('%.0f%% %s', b.state_of_charge * 100, b.state)
    end
    -- Get the current time
    local time = wezterm.strftime("%I:%M %p")

    -- Left status (workspace or key table)
    window:set_left_status(wezterm.format({
      { Foreground = { Color = stat_color } },
      { Text = "  " },
      { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
      { Text = " |" },
    }))

    -- Right status (directory, command, time)
    window:set_right_status(wezterm.format({
      { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
      { Text = " | " },
      { Foreground = { Color = "#e0af68" } },
      { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
      "ResetAttributes",
      { Text = " | " },
      { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
      { Text = " | " },
      { Text = wezterm.nerdfonts.md_battery .. "  " .. bat },
      { Text = "  " },
    }))
  end)

  return config
end

return M

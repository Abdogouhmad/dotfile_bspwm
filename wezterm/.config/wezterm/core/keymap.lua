-- keybindings.lua
local w = require 'wezterm'

return {
  -- Example: Reload the configuration file
  { key = 'r', mods = 'CTRL', action = w.action.ReloadConfiguration },
  -- Example: Create a new tab
  { key = 't', mods = 'ALT', action = w.action.SpawnTab 'CurrentPaneDomain' },
  -- Example: Split the pane horizontally
  { key = 'Enter', mods = 'CTRL|SHIFT', action = w.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- Example: Split the pane vertically
  { key = 'h', mods = 'ALT', action = w.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- Example: Close the current pane
  { key = 'k', mods = 'ALT', action = w.action.CloseCurrentPane { confirm = true } },
  -- Navigate between tabs using Ctrl + Shift + Left/Right Arrow
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = w.action.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = w.action.ActivateTabRelative(1) },
  -- Navigate between split windows (panes)
  { key = '{', mods = 'ALT|SHIFT', action = w.action.ActivatePaneDirection 'Left' },
  { key = '}', mods = 'ALT|SHIFT', action = w.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CTRL|SHIFT', action = w.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CTRL|SHIFT', action = w.action.ActivatePaneDirection 'Down' },

    -- Keybindings for Workspace Management

  -- Open a new workspace
  { key = 'n', mods = 'ALT', action = w.action.SwitchToWorkspace { name = 'workspace1' } },
  { key = 'b', mods = 'ALT', action = w.action.SwitchToWorkspace { name = 'Btop', spawn = { args = {'btop'}} } },
  -- Switch to the next workspace
  { key = 'n', mods = 'CTRL', action = w.action.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'CTRL', action = w.action.SwitchWorkspaceRelative(-1) },

  -- Close the current pane (acts like closing workspace)
  { key = 'w', mods = 'ALT|SHIFT', action = w.action.CloseCurrentPane { confirm = true } },

  {
    key = '9',
    mods = 'ALT',
    action = w.action.ShowLauncherArgs { flags = 'FUZZY|TABS|WORKSPACES' },
  },
}

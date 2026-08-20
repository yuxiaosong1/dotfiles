-- path(window): ~\.config\wezterm\wezterm.lua
local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
config.keys = {}

------------------------------------- default program -------------------------------------
config.default_prog = { 'cmd', '/c', 'D:\\Software\\msys2\\msys2\\msys2_shell.cmd -defterm -here -no-start -mingw64'}
------------------------------------- default program -------------------------------------

------------------------------------ font/colorscheme ------------------------------------
-- other hotkey:
--	<C-+>/<C-->: increase/decrease font size
config.font = wezterm.font 'Iosevka NFM'
--config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14.0
config.color_scheme = 'nord'
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
------------------------------------ font/colorscheme ------------------------------------

--------------------------------------- ssh domain ---------------------------------------
config.ssh_domains = { { name = 'ssh-192.168.220.128', remote_address = '192.168.220.128', username = 'yuxiaosong' } }
--------------------------------------- ssh domain ---------------------------------------

---------------------------------------- launcher ----------------------------------------
config.launch_menu = {
	{ label = 'ssh-192.168.220.128', domain = { DomainName = 'ssh-192.168.220.128' } },
	--{ label = 'ssh-192.168.164.129', args = { 'ssh', 'yuxiaosong@192.168.164.129' } },
	{ label = 'mingw64', args = { 'cmd', '/c', 'D:\\Software\\msys2\\msys2\\msys2_shell.cmd -defterm -here -no-start -mingw64' } },
	{ label = 'powershell', args = { 'powershell.exe' } }
}
-- only show what i want
table.insert(config.keys, { key = '`', mods = 'ALT', action = act.ShowLauncherArgs{ flags = 'LAUNCH_MENU_ITEMS' } })
---------------------------------------- launcher ----------------------------------------

----------------------------------------- scroll -----------------------------------------
-- other hotkey:
--	<S-PgUp>/<S-PgDn>: scroll by page
--	<C-S-f>: activate the search
config.scrollback_lines = 10000
table.insert(config.keys, { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) })
table.insert(config.keys, { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) })
----------------------------------------- scroll -----------------------------------------

------------------------------------------- tab -------------------------------------------
config.window_frame = {
  font = wezterm.font { family = 'Iosevka NFM', weight = 'Bold' },
  font_size = 14,
}
table.insert(config.keys, { key = 'w', mods = 'ALT', action = act.CloseCurrentTab { confirm = true } })
for i = 1, 8 do
  -- ALT + number to activate that tab
  table.insert(config.keys, { key = tostring(i), mods = 'ALT', action = act.ActivateTab(i - 1) })
end
table.insert(config.keys, { key = 't', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' })
------------------------------------------- tab -------------------------------------------

----------------------------------------- window -----------------------------------------
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
table.insert(config.keys, { key = 'n', mods = 'ALT', action = act.SpawnWindow })
----------------------------------------- window -----------------------------------------

------------------------------------ quick select mode ------------------------------------
config.colors = { -- red color
  quick_select_label_bg = { Color = '#c82423' },
  quick_select_label_fg = { Color = '#ffffff' },
  quick_select_match_bg = { Color = 'rgba(200,40,40,0.20)' },
  quick_select_match_fg = { Color = '#ffbbbb' },
}
table.insert(config.keys, { key = 'q', mods = 'ALT', action = act.QuickSelect })
------------------------------------ quick select mode ------------------------------------

------------------------------------------ pane ------------------------------------------
-- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
table.insert(config.keys, { key = '0', mods = 'ALT', action = act.PaneSelect })
table.insert(config.keys, { key = 'z', mods = 'CTRL', action = act.TogglePaneZoomState })
table.insert(config.keys, { key = 'h', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } })
table.insert(config.keys, { key = 'v', mods = 'CTRL|ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } })
table.insert(config.keys, { key = 'w', mods = 'CTRL', action = act.CloseCurrentPane { confirm = true } })
table.insert(config.keys, { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' })
table.insert(config.keys, { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' })
table.insert(config.keys, { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' })
table.insert(config.keys, { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' })
------------------------------------------ pane ------------------------------------------

return config

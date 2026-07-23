-- キーバインド設定
local wezterm = require("wezterm")
local act = wezterm.action

-- アクティブなキーテーブルをステータス表示
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

return {
	leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 },

	keys = {
		-- ワークスペース
		{
			key = "w",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
		{
			key = "$",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		{
			key = "W",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "Enter name for new workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},

		-- タブ操作
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "{", mods = "LEADER", action = act.MoveTabRelative(-1) },
		{ key = "}", mods = "LEADER", action = act.MoveTabRelative(1) },
		{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
		{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
		{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
		{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
		{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
		{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
		{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
		{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
		{ key = "9", mods = "CMD", action = act.ActivateTab(8) },

		-- コピー & ペースト
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

		-- 表示設定
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },

		-- コマンド & 設定
		{ key = "p", mods = "CMD", action = act.ActivateCommandPalette },
		{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
		{ key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
	},

	mouse_bindings = {
		-- 右クリックでクリップボードから貼り付け
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CTRL",
			action = act.PasteFrom("PrimarySelection"),
		},

		-- ドラッグ選択・単語選択・行選択を離した時点でクリップボードへ自動コピー
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
		{
			event = { Up = { streak = 2, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
		{
			event = { Up = { streak = 3, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
	},
}

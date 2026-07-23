-- キーバインド設定
local wezterm = require("wezterm")
local act = wezterm.action

local keybinds = {}

keybinds.keys = {
	--
	{
		key = "r",
		mods = "ALT|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.PasteFrom("Clipboard"),
	},
}

-- マウス操作の挙動設定
keybinds.mouse_bindings = {
	-- 右クリックでクリップボードから貼り付け
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "CTRL",
		action = act.PasteFrom("PrimarySelection"),
	},
}

return keybinds

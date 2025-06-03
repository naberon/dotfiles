-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ここまでは定型文
-- この先でconfigに各種設定を書いていく
config.font = wezterm.font("Bizin Gothic Discord Regular", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズ
config.font_size = 13.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.80

-- キーバインド
config.keys = {
	--
	{
		key = "r",
		mods = "ALT|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	-- ¥ではなく、バックスラッシュを入力する。おそらくMac固有
	{
		key = "¥",
		action = wezterm.action.SendKey({ key = "\\" }),
	},
	-- Altを押した場合はバックスラッシュではなく¥を入力する。おそらくMac固有
	{
		key = "¥",
		mods = "ALT",
		action = wezterm.action.SendKey({ key = "¥" }),
	},
	-- ⌘ + でフォントサイズを大きくする
	{
		key = "+",
		mods = "CMD|SHIFT",
		action = wezterm.action.IncreaseFontSize,
	},
	-- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- ⌘ Ctrl ,で下方向にペイン分割
	{
		key = ",",
		mods = "CMD|CTRL",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	-- ⌘ Ctrl .で右方向にペイン分割
	{
		key = ".",
		mods = "CMD|CTRL",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	-- ⌘ Ctrl oでペインの中身を入れ替える
	{
		key = "o",
		mods = "CMD|CTRL",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	-- ⌘ Ctrl hjklでペインの移動
	{
		key = "h",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CMD|CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- ⌘ Ctrl Shift hjklでペイン境界の調整
	{
		key = "h",
		mods = "CMD|CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 2 }),
	},
	{
		key = "j",
		mods = "CMD|CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 2 }),
	},
	{
		key = "k",
		mods = "CMD|CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 2 }),
	},
	{
		key = "l",
		mods = "CMD|CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 2 }),
	},
}

-- マウス操作の挙動設定
config.mouse_bindings = {
	-- 右クリックでクリップボードから貼り付け
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

config.default_domain = "WSL:Ubuntu-24.04"

-- タブを下に表示（デフォルトでは上にある）
--config.tab_bar_at_bottom = true
return config

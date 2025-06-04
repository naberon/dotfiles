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
--config.font = wezterm.font("Bizin Gothic Discord Regular", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font = wezterm.font("Bizin Gothic Discord NF", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズ
config.font_size = 13.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.80

local act = wezterm.action
-- キーバインド
config.keys = {
	--
	{
		key = "r",
		mods = "ALT|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.PasteFrom("PrimarySelection"),
	},
}

-- マウス操作の挙動設定
config.mouse_bindings = {
	-- 右クリックでクリップボードから貼り付け
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "CTRL",
		action = act.PasteFrom("PrimarySelection"),
	},
}

--config.default_domain = "WSL:Ubuntu-24.04"

-- タブを下に表示（デフォルトでは上にある）
--config.tab_bar_at_bottom = true
return config

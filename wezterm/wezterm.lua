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

-- 基本設定
config.automatically_reload_config = true
--config.font = wezterm.font("Bizin Gothic Discord Regular", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font = wezterm.font("Bizin Gothic Discord NF", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズ
config.font_size = 13.0
config.use_ime = true

-- 背景透過
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.80

-- タイトルバー & タブ設定
-- タイトルバーを非表示（リサイズハンドルのみ）
config.window_decorations = "RESIZE"

-- タブが1つでも常にタブバーを表示
config.hide_tab_bar_if_only_one_tab = false

-- タブバーの透過設定
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる（黒）
config.window_background_gradient = {
	colors = { "#000000" },
}

-- +ボタンを表示
config.show_new_tab_button_in_tab_bar = true

-- タブ同士の境界線を非表示、閉じるボタンの色をタイトルと統一
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
		active_tab = {
			bg_color = "#ae8b2d",
			fg_color = "#FFFFFF",
		},
		inactive_tab = {
			bg_color = "#5c6d74",
			fg_color = "#FFFFFF",
		},
		inactive_tab_hover = {
			bg_color = "#5c6d74",
			fg_color = "#FFFFFF",
		},
	},
}

-- タブの装飾（背景色のみ、矢印なし）
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

-- キーバインド設定は keybinds.lua に分離
local keybinds = require("keybinds")
config.keys = keybinds.keys
config.mouse_bindings = keybinds.mouse_bindings

--config.default_domain = "WSL:Ubuntu-24.04"

-- タブを下に表示（デフォルトでは上にある）
--config.tab_bar_at_bottom = true
return config

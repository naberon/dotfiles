-- 見た目設定
local wezterm = require("wezterm")

local appearance = {}

--appearance.font = wezterm.font("Bizin Gothic Discord Regular", { weight = "Medium", stretch = "Normal", style = "Normal" })
appearance.font = wezterm.font("Bizin Gothic Discord NF", { weight = "Medium", stretch = "Normal", style = "Normal" })
-- フォントサイズ
appearance.font_size = 13.0

-- 背景透過
-- 背景の非透過率（1なら完全に透過させない）
appearance.window_background_opacity = 0.80

-- タイトルバー & タブ設定
-- タイトルバーを非表示（リサイズハンドルのみ）
appearance.window_decorations = "RESIZE"

-- タブが1つでも常にタブバーを表示
appearance.hide_tab_bar_if_only_one_tab = false

-- タブバーの透過設定
appearance.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる（黒）
appearance.window_background_gradient = {
	colors = { "#000000" },
}

-- +ボタンを表示
appearance.show_new_tab_button_in_tab_bar = true

-- タブ同士の境界線を非表示、閉じるボタンの色をタイトルと統一
appearance.colors = {
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

-- タブを下に表示（デフォルトでは上にある）
--appearance.tab_bar_at_bottom = true

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

return appearance

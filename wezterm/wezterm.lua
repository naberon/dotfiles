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

-- 挙動設定
-- 設定ファイル変更を自動リロード
config.automatically_reload_config = true
-- 日本語IME入力対応
config.use_ime = true
-- スクロールバック行数
config.scrollback_lines = 10000
-- ベル音を無効化
config.audible_bell = "Disabled"
-- 更新チェック通知を無効化
config.check_for_updates = false

--config.default_domain = "WSL:Ubuntu-24.04"

-- 見た目設定は appearance.lua に分離
local appearance = require("appearance")
for key, value in pairs(appearance) do
	config[key] = value
end

-- キーバインド設定は keybinds.lua に分離
config.disable_default_key_bindings = true
local keybinds = require("keybinds")
config.keys = keybinds.keys
config.mouse_bindings = keybinds.mouse_bindings
config.leader = keybinds.leader

return config

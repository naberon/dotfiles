# CLAUDE.md

このリポジトリで作業する際の Claude Code 向けガイドです。

## リポジトリ概要

各種開発ツールの設定ファイルを管理する個人用 dotfiles リポジトリ。
`install.sh` でシンボリックリンクを作成して各設定を反映する。

## インストール

```bash
# シンボリックリンクを作成
./install.sh

# シンボリックリンクを削除
./unlink.sh
```

作成されるシンボリックリンク:
- `~/.zshrc` → `zsh/.zshrc`
- `~/.gitconfig` → `gitconfig`
- `~/.tigrc` → `tigrc`
- `~/.config/tmux` → `tmux/`
- `~/.config/sheldon` → `sheldon/`
- `~/.config/wezterm` → `wezterm/`
- `~/.config/nvim` → `nvim/`
- `~/.config/lazygit` → `lazygit/`

**注意**: `gemrc`、`zprofile`、`mklink.bat`（Windows用）はリポジトリに含まれるが install.sh には未組み込み。

## bin/ (自作CLIツール)

`bin/` を `zsh/.zshrc` で PATH に追加済み。symlink不要、どの環境でもリポジトリをクローンすれば呼べる。

- `notice_discord <message>` — Discord Webhook通知。`DISCORD_WEBHOOK_URL` を使用（下記secrets参照）。

## secrets (`zsh/.env`)

git管理したくない値（webhook URL、APIキー等）は `zsh/.env` に書く。gitignore済み、`.zshrc` 起動時に自動source。書式は `zsh/.env.example` 参照。
非対話シェル（cron等）からは読み込まれない点に注意。

## 設定ファイル構成

### Neovim (`nvim/`)

lazy.nvim でプラグイン管理。

エントリポイント: `init.lua` が以下の3モジュールを読み込む:
- `lua/general.lua` — 基本設定
- `lua/keymap.lua` — キーマッピング
- `lua/plugin.lua` — lazy.nvim プラグイン設定

プラグインは `lua/plugins/` 配下に個別ファイルで定義（30ファイル以上）。
**詳細なプラグイン一覧とキーマップは `nvim_plugin.md` を参照。**

主要プラグイン:
- 検索: telescope.nvim
- 補完: blink.cmp + LuaSnip
- LSP: nvim-lspconfig + mason.nvim + lspsaga
- フォーマット: conform.nvim（保存時自動実行）
- Git: gitsigns, diffview, git-conflict
- UI: noice.nvim, lualine, catppuccin / tokyonight テーマ
- ファイラ: oil.nvim, nvim-tree
- ターミナル: toggleterm
- 診断: Trouble, lsp_lines, tiny-inline-diagnostic

自動インストールされる LSP サーバー: `lua_ls`, `ts_ls`, `vue_ls`, `html`, `cssls`, `intelephense`（PHP）

**Neovim の依存ツール**: git, make, gcc, ripgrep, fd-find, Nerd Font

#### プラグイン追加手順

1. `nvim/lua/plugins/` に新規ファイルを作成
2. lazy.nvim プラグインスペックを返す:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       -- 設定
     end,
   }
   ```
3. `nvim/lua/plugin.lua` の `neovim_plugins` テーブルに `require 'plugins.myplugin'` を追加
4. Neovim 再起動で自動インストール

### Zsh (`zsh/`)

sheldon でプラグイン管理（設定: `sheldon/plugins.toml`）、テーマは powerlevel10k。

主な機能:
- fzf 連携: 履歴検索 `Ctrl+R`、ディレクトリ移動 `Ctrl+Q`
- mise でランタイムバージョン管理
- プラグイン: zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search

### Tmux (`tmux/tmux.conf`)

- プレフィックスキー: `Ctrl+J`（デフォルトの `Ctrl+B` から変更）
- ペイン操作: vi 風キーバインド（h/j/k/l）
- 分割: `|` で垂直、`-` で水平
- true color 対応済み
- クリップボード: Wayland (wl-clipboard) 連携済み

### WezTerm (`wezterm/wezterm.lua`)

フォント: Bizin Gothic Discord NF、IME サポート有効、カスタムキーバインドあり。

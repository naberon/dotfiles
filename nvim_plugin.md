---
client:
case:
project:
aliases:
created: 2025-12-21 19:57
tags:
  - date/2025-12-21
---
# 検索・ファジーファインダー
## telescope.nvim
ファイル、バッファ、grep、LSPなど様々な検索をファジーファインダーで実行

作成したファイル: nvim/lua/plugins/telescope.lua

  依存プラグイン:
  - plenary.nvim
  - telescope-fzf-native.nvim
  - telescope-ui-select.nvim
  - nvim-web-devicons

  キーマップ:
  | キー         | 説明                                 |
  |--------------|--------------------------------------|
  | `<C-f><C-f>` | ファイル検索                         |
  | `<C-f><C-b>` | バッファ一覧                         |
  | `<C-f><C-r>` | 前回の検索を再開                     |
  | `<C-f><C-h>` | 最近開いたファイル（カレントディレクトリ） |
  | `<C-f>H`     | 最近開いたファイル（全体）           |
  | `<C-f><C-d>` | 診断結果の検索                       |
  | `<C-f><C-g>` | ライブgrep（カレントディレクトリ）   |
  | `<C-f>/`     | ライブgrep（開いているファイルのみ） |
  | `<C-f>*`     | カーソル位置の単語を検索             |
  | `<C-f><C-s>` | 現在のバッファ内をあいまい検索       |
  | `<C-f><C-v>` | Neovim設定ファイルを検索             |
  | `<leader>ss` | Telescope機能一覧                    |

  Telescope内での操作:
  - `<C-/>` (挿入モード) / `?` (通常モード) でキーマップヘルプを表示

# ファイラ
## oil.nvim

使い方：
  - - を押すと現在のファイルの親ディレクトリをバッファとして開く
  - ファイル操作（リネーム、削除、作成）はバッファを編集して :w で保存

## nvim-tree.lua
作成したファイル: nvim/lua/plugins/nvim-tree.lua

設定内容:
サイドバー幅: 30
隠しファイル（dotfiles）を表示

キーマップ  
`<leader>e` - ファイルエクスプローラーの表示/非表示  
`<leader>E` - 現在のファイルをエクスプローラーで表示


# git系
## gitsigns.nvim
バッファ内のgit差分を左側に表示（追加: `+`, 変更: `~`, 削除: `_`）

作成したファイル: nvim/lua/plugins/gitsigns.lua

## diffview
差分表示

  キーマップ:
  | キー       | 説明                 |
  |------------|----------------------|
  | `<leader>gd` | 差分ビューを開く     |
  | `<leader>gh` | 現在のファイルの履歴 |
  | `<leader>gH` | ブランチ全体の履歴   |
  | `<leader>gq` | 差分ビューを閉じる   |

## git-conflict.nvim
コンフリクト箇所はハイライト表示されます。
  | キー | 説明                      |
  |------|---------------------------|
  | `co`   | 自分の変更を選択 (ours)   |
  | `ct`   | 相手の変更を選択 (theirs) |
  | `cb`   | 両方を選択 (both)         |
  | `c0`   | 両方を削除 (none)         |
  | `]x`   | 次のコンフリクトへ移動    |
  | `[x`   | 前のコンフリクトへ移動    |

# 通知
## noice.nvim
 作成したファイル: nvim/lua/plugins/noice.lua

  依存プラグイン（自動インストール）:
  - nui.nvim - UIコンポーネント
  - nvim-notify - 通知表示

  機能:
  - コマンドラインをポップアップ表示
  - メッセージを右上に通知表示
  - LSPのホバー/シグネチャをモダンなUIで表示
  - 検索を画面下部に表示

# LSP
## nvim-lspconfig + mason.nvim
LSPサーバーの設定と自動インストール

作成したファイル: nvim/lua/plugins/nvim-lspconfig.lua

  依存プラグイン:
  - mason.nvim - LSPサーバーのインストール管理
  - mason-lspconfig.nvim - masonとlspconfigの連携
  - mason-tool-installer.nvim - ツールの自動インストール
  - fidget.nvim - LSP進捗表示

  自動インストールされるサーバー:
  - lua_ls (Lua)
  - ts_ls (TypeScript/JavaScript)
  - vue_ls (Vue)
  - html, cssls
  - intelephense (PHP)

  キーマップ (LSP接続時):
  | キー    | 説明                       |
  |---------|----------------------------|
  | `grr`   | 参照を検索 (Telescope)     |
  | `gri`   | 実装へ移動 (Telescope)     |
  | `grd`   | 定義へ移動 (Telescope)     |
  | `grt`   | 型定義へ移動 (Telescope)   |
  | `grD`   | 宣言へ移動                 |
  | `grn`   | リネーム                   |
  | `gra`   | コードアクション           |
  | `gk`    | ホバードキュメント         |
  | `gO`    | ドキュメントシンボル       |
  | `gW`    | ワークスペースシンボル     |

## Trouble
診断結果をリスト表示、クイックフィックス/参照も統合表示

  キーマップ:
  | キー         | 説明                          |
  |--------------|-------------------------------|
  | `<leader>xx` | 全体の診断を表示              |
  | `<leader>xX` | 現在バッファの診断を表示      |
  | `<leader>cs` | シンボル表示                  |
  | `<leader>cl` | LSP定義/参照を表示            |
  | `<leader>xL` | ロケーションリスト            |
  | `<leader>xQ` | クイックフィックスリスト      |

## lspsaga.nvim
LSP UI全体を強化（診断、定義プレビュー、アウトラインなど） |

作成したファイル: nvim/lua/plugins/lspsaga.lua

  キーマップ:
  | キー       | 説明               |
  |------------|--------------------|
  | `gf`         | 参照を検索         |
  | `gp`         | 定義をプレビュー   |
  | `gP`         | 型定義をプレビュー |
  | `K`          | ホバードキュメント |
  | `<leader>ca` | コードアクション   |
  | `<leader>rn` | リネーム           |
  | `<leader>o`  | アウトライン表示   |
  | `[d`         | 前の診断へ移動     |
  | `]d`         | 次の診断へ移動     |
  | `<leader>sl` | 行の診断を表示     |

## lsp_lines.nvim
診断を仮想行で複数行表示（デフォルトはオフ）

  | キー         | 説明                |
  |--------------|---------------------|
  | `<leader>tl` | lsp_linesの表示切替 |

## tiny-inline-diagnostic.nvim
インライン診断をきれいに表示（デフォルトのvirtual_textを無効化） 

## diagflow.nvim
カーソル位置の診断を画面右上に表示

# 補完・スニペット
## blink.cmp
高速な補完エンジン

作成したファイル: nvim/lua/plugins/blink_cmp.lua

  依存プラグイン:
  - LuaSnip - スニペットエンジン
  - friendly-snippets - 各言語の定義済みスニペット集

  キーマップ (挿入モード):
  | キー       | 説明                     |
  |------------|--------------------------|
  | `<Tab>`    | 補完を確定               |
  | `<S-Tab>`  | スニペット内で前に移動   |
  | `<C-Space>`| 補完メニューを開く       |
  | `<C-n>`    | 次の候補                 |
  | `<C-p>`    | 前の候補                 |
  | `<C-e>`    | メニューを閉じる         |
  | `<C-k>`    | シグネチャヘルプ表示     |

# フォーマット
## conform.nvim
保存時の自動フォーマットおよび手動フォーマット

作成したファイル: nvim/lua/plugins/conform.lua

  対応フォーマッター:
  - Lua: stylua
  - JavaScript/TypeScript/Vue: prettier

  キーマップ:
  | キー       | 説明               |
  |------------|--------------------|
  | `<leader>f`| バッファをフォーマット |

# 編集補助
## nvim-surround
テキストを括弧やクォートで囲む操作

作成したファイル: nvim/lua/plugins/nvim-surround.lua

  キーマップ:
  | キー         | 説明                           |
  |--------------|--------------------------------|
  | `ys{motion}{char}` | 囲みを追加 (例: `ysiw"`)  |
  | `ds{char}`   | 囲みを削除 (例: `ds"`)         |
  | `cs{old}{new}` | 囲みを変更 (例: `cs"'`)      |
  | `S{char}`    | ビジュアルモードで囲みを追加   |

## mini.nvim
複数の小さなプラグインのコレクション

作成したファイル: nvim/lua/plugins/mini.lua

  有効なモジュール:
  - mini.ai - 拡張テキストオブジェクト
  - mini.pairs - 自動括弧補完
  - mini.statusline - シンプルなステータスライン

  mini.ai キーマップ例:
  | キー    | 説明                       |
  |---------|----------------------------|
  | `va)`   | 括弧を含めて選択           |
  | `vi)`   | 括弧の中を選択             |
  | `yinq`  | 次のクォート内をヤンク     |
  | `ci'`   | クォート内を変更           |

## todo-comments.nvim
TODO, FIXME, HACK, NOTE などのコメントをハイライト表示

作成したファイル: nvim/lua/plugins/todo-comments.lua

## which-key.nvim
キーマップのヘルプをポップアップ表示

作成したファイル: nvim/lua/plugins/which-key.lua

  使い方:
  - キーを押して少し待つと、続くキーマップの一覧がポップアップ表示される
  - 例: `<leader>` を押すとleaderキーに続くマッピング一覧が表示

# ターミナル
## toggleterm.nvim 

  作成したファイル: nvim/lua/plugins/toggleterm.lua

  キーマップ:
  | キー       | 説明                                |
  |------------|-------------------------------------|
  | `<C-\>`      | ターミナルの表示/非表示（フロート） |
  | `<leader>tt` | フロートターミナル                  |
  | `<leader>th` | 水平分割ターミナル                  |
  | `<leader>tv` | 垂直分割ターミナル                  |

  ターミナルモードでの操作:
  - `<C-\>` で閉じる
  - ターミナル内では通常のシェル操作が可能

# コメント
## comment.nvim
 軽量で高機能、Treesitter対応
`ts-context-commentstring`も一緒に導入し、JSX/Vue等でコンテキストに応じたコメント形式が自動判定される

  作成したファイル: nvim/lua/plugins/comment.lua
  キーマップ:
  | キー       | 説明                         |
  |------------|------------------------------|
  | `gcc`        | 行コメントトグル             |
  | `gc{motion}` | モーションでコメントトグル   |
  | `gbc`        | ブロックコメントトグル       |
  | `gb{motion}` | モーションでブロックコメント |
  | `gcO`        | 上に空コメント行を追加       |
  | `gco`        | 下に空コメント行を追加       |
  | `gcA`        | 行末にコメントを追加         |

# 言語系
## HTML
### emmet-vim
 対応ファイルタイプ: HTML, CSS, JavaScript, JSX, TypeScript, TSX, Vue, Svelte

  使い方:
  | キー   | 説明                 |
  |--------|----------------------|
  | <C-y>, | Emmet展開            |
  | <C-y>d | 選択範囲をタグで囲む |
  | <C-y>/ | コメントトグル       |

  例:
  div>ul>li*3  →  <C-y>,  →  <div><ul><li></li><li></li><li></li></ul></div>

# カラーハイライト
## nvim-highlight-colors
カラーコード（HEX, RGB, HSL, Tailwind等）を色付きで表示

  設定:
  - 表示形式: 仮想テキスト (`●`)
  - 名前付きカラー対応 (`red`, `blue`等)
  - Tailwind CSS対応

# シンタックスハイライト
## nvim-treesitter
高精度なシンタックスハイライトとインデント

作成したファイル: nvim/lua/plugins/nvim-treesitter.lua

  自動インストールされるパーサー:
  - bash, c, diff, html, lua, luadoc
  - markdown, markdown_inline, query
  - vim, vimdoc, php

  機能:
  - 自動パーサーインストール有効
  - インデント有効（Rubyを除く）

# UI
## lualine.nvim
カスタマイズ可能なステータスライン・タブライン

作成したファイル: nvim/lua/plugins/lualine.lua

  表示内容:
  - ステータスライン: モード、ブランチ、差分、ファイル名、診断、ファイルタイプ、位置
  - タブライン: バッファ一覧、タブ一覧

## catppuccin
モダンなカラースキーム（Mochaテーマ使用）

作成したファイル: nvim/lua/plugins/catppuccin.lua

  設定:
  - 透明背景有効
  - イタリック無効
  - gitsigns, telescope連携

----

 # SSHエージェントにキーを追加
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519  # または ~/.ssh/id_rsa

  ssh -T git@github.com 2>&1 || true

 git fetch origin && git rebase origin/master

----
# 導入したいプラグイン
## ui
bufferline.nvim
## lint
none-ls.nvim

## edit
hop.nvim / flash.nvim　カーソル移動

## yank history
yanky.nvim

## PHP
Intelephense
PHP Actor
Laravel Pint / PHP CS Fixer
neotest-php

nvim-ts-autotag
nvim-ts-context-commentstring
blade-nav.nvim

# HTML
Emmet.vim

# JS / TS
typescript-tools.nvim
nvim-ts-autotag
nvim-vtsls
package-info.nvim
nvim-ts-autotag

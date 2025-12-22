---
client:
case:
project:
aliases:
created: 2025-12-21 19:57
tags:
  - date/2025-12-21
---
# ファイル
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

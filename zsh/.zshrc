# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#プロンプト カラー
autoload colors
colors

eval "$(dircolors -b)"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=100000           # メモリに保存されるヒストリの件数
SAVEHIST=100000           # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt histignorealldups  # 同じコマンドを記録しない


# ディレクトリ名を入力するだけでcdが実行される
setopt auto_cd

# スペルミス
setopt correct # コマンドのスペルミスを自動で訂正する

# ディレクトリ内容のキャッシュを無効にする
#setopt stat 

# Use modern completion system
autoload -Uz compinit
compinit

# 補完候補リストの説明部分のフォーマット: 'specify: [説明]' の形式で表示
zstyle ':completion:*' auto-description 'specify: %d'

# 補完を実行する順番を定義: 展開 -> 完全に一致 -> 訂正 -> 近似
zstyle ':completion:*' completer _expand _complete _correct _approximate

# 補完のヘッダー行のフォーマット: 'Completing [コンテキスト]' の形式で表示
zstyle ':completion:*' format 'Completing %d'

# 補完候補を種類ごとにグループ化して表示する (例: ファイル、ディレクトリ、オプションなど)
zstyle ':completion:*' group-name ''

# 補完メニューの動作: 候補が2つ以上ある場合に選択可能なメニューを表示
zstyle ':completion:*' menu select

# 補完リストのプロンプト: 画面最下部に表示される 'Hit TAB for more' などのメッセージのフォーマット
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# マッチングルールを設定: 大文字小文字の区別を無視し、区切り文字も無視してマッチさせる
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# 補完メニューが画面外にスクロールするときのプロンプト表示フォーマット
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# 従来の compctl コマンドを使った補完定義を無効にする (モダンな compsys のみを使用)
zstyle ':completion:*' use-compctl false

# 補完の際に詳細な説明を表示する (グループ名、説明文など)
zstyle ':completion:*' verbose true

# 補完候補リストの説明部分のフォーマット: 説明文を太字の区切り線で囲んで表示
zstyle ':completion:*:descriptions' format '%B--- %d ---%b'

# 補完候補のリストにLS_COLORSに基づいた色付けを適用
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# --- 特定のコマンド (kill) への設定 ---
# kill コマンドのプロセスリストの色付け: PIDを赤字で強調
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# kill コマンドの補完候補リストに使用するコマンド (プロセスID、CPU、実行コマンドなどを表示)
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


###################
### key
###################
# カーソル位置から行末までを削除 (Ctrl + K)
bindkey '^k' kill-line
# カーソル前の単語を削除 (Alt/Option + Backspace)
bindkey '\M-\H' backward-kill-word


###################
### alias
###################
alias ls='ls --color'
alias ll='ls -la --color'
alias vim='nvim'
alias lg='lazygit'
alias ld='lazydocker'

###################
### path
###################

# add sheldon path
export PATH=$PATH:$HOME/.local/bin

# docker sock
#export DOCKER_HOST=unix:///run/user/$(id -u)/podman/podman.sock

###################
### init
###################
#
eval "$(sheldon source)"

eval "$(~/.local/bin/mise activate zsh)"


############
##  plugin
############

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# plugin: zsh-history-substring-search
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down


###################
# cd history
###################
#自動でpushdする
setopt auto_pushd

#pushdの履歴は残さない。
setopt pushd_ignore_dups

###################
# cdr 
###################
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# fzf
# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# fzf cdr
function fzf-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --reverse)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-cdr
setopt noflowcontrol
bindkey '^q' fzf-cdr

## 時間のかかるコマンド実行時に完了したタイミングで通知する
# gok npm install 
function gok() {
  "$@"
  local exit_status=$?
  if [ $exit_status -eq 0 ]; then
    # 正常終了時: ウィンドウ名を一瞬だけ変えて戻すことで activity を発生させる
    local old_name=$(tmux display-message -p '#W')
    tmux rename-window "DONE!"
    sleep 0.1
    tmux rename-window "$old_name"
  fi
  return $exit_status
}

# ── fzf ─────────────────────────────────────────
# シェル統合（Ctrl+T, Alt+C を有効化）
source <(fzf --zsh)
# デフォルトのファイル検索を fd に切り替え（.gitignore 自動尊重・高速）
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --border
'

# Ctrl+T（ファイル検索）のみプレビューを有効化
export FZF_CTRL_T_OPTS='
  --preview "bat --color=always --style=numbers --line-range=:50 {}"
  --preview-window=right:60%
'

# rg + fzf → 検索結果を選択して nvim で開く
# 使い方: frg <検索ワード>
function fzf-rg() {
  local result
  result=$(rg --color=always --line-number --no-heading "$@" | \
    fzf --ansi \
        --delimiter=':' \
        --preview 'bat --color=always --style=numbers {1}' \
        --preview-window 'right:50%:wrap')
  if [[ -n "$result" ]]; then
    local file=$(echo "$result" | cut -d: -f1)
    local line=$(echo "$result" | cut -d: -f2)
    nvim +"$line" "$file"
  fi
}
alias frg='fzf-rg'

# bun completions
[ -s "/home/naberon/.bun/_bun" ] && source "/home/naberon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude plugin headroom
claude-hr() {
    # 8787番ポートの古いプロセスを掃除
    kill -9 $(lsof -t -i:8787) 2>/dev/null
    # 後ろに付けられた引数（$@）をそのまま引き継いで起動
    headroom wrap claude "$@"
}

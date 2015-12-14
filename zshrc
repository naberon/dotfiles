# Created by newuser for 5.0.5
#

#文字コード
export LANG=ja_JP.UTF-8


HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=100000           # メモリに保存されるヒストリの件数
SAVEHIST=100000           # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt share_history      # 同一ホストでの履歴の共有


# zsh 設定のパス設定
fpath=(~/.zsh/completion $fpath)

# brew zsh & zsh_completions
fpath=($(brew --prefix)/share/zsh_completions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# 保管
autoload -Uz compinit
compinit

#プロンプト カラー
autoload colors
colors

# プロンプトフォーマット
PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "

# vcs 右プロンプト
source "${HOME}/.zsh/vcs_info.zsh"

#履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# 矢印キーのインターフェイスを使って自動補完
zstyle ':completion:*' menu select
# エイリアスでコマンドラインの自動補完を切り替える
setopt completealiases

#cdの設定
#ディレクトリ名だけで移動する。
setopt auto_cd

#自動でpushdする
setopt auto_pushd

#pushdの履歴は残さない。
setopt pushd_ignore_dups

#ターミナルのタイトル
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac 

#色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'


#alias
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

# tmux + mac clipboard
if [ -n "$TMUX" ]; then
    alias pbcopy="reattach-to-user-namespace pbcopy"
fi
#ビープ音ならなさない
setopt nobeep

#改行のない出力をプロンプトで上書きするのを防ぐ
unsetopt promptcr


# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# phpbrew
source ~/.phpbrew/bashrc

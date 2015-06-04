"----------------------------------------
" システム設定
"----------------------------------------
"コメント以外で全角スペースを指定している部分があるので
"scriptencodingと、このファイルのエンコードが一致するよう注意！
set nocompatible               " be iMproved
filetype off


let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \ (!executable('xdg-open') &&
      \ system('uname') =~? '^darwin'))

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

"unix,win32でのPathの違いを吸収
if s:is_windows 
  let $CFGHOME=$VIM.'/vimfiles'
elseif has('unix')
  let $CFGHOME=$HOME.'/.vim'
endif

if has('vim_starting')
  set rtp+=$CFGHOME/bundle/neobundle.vim
endif

"call vundle#rc('$CFGHOME/bundle')
call neobundle#begin(expand('$CFGHOME/bundle/'))

" let Vundle manage Vundle
" required! 
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }

NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {'insert' : 1}}

NeoBundleLazy 'Shougo/neosnippet-snippets', {
      \ 'autoload' : {'insert' : 1}}

NeoBundleLazy 'Shougo/vimfiler', {
\ 'autoload' : { 'commands' : [ 'VimFilerBufferDir' ] },
\ 'depends': [ 'Shougo/unite.vim' ],
\}

NeoBundleLazy 'Shougo/unite.vim' , {
\ 'autoload' : { 'commands' : [ 'Unite' ] }}

NeoBundleLazy 'Shougo/neomru.vim' , {
\ 'autoload' : { 'unite_sources' : ['file_mru', 'directory_mru'] }}
NeoBundleLazy 'tsukkee/unite-tag' , {
\ 'autoload' : { 'unite_sources' : [ 'tag', 'tag/file', 'tag/include' ] }}
NeoBundleLazy 'Shougo/unite-outline' , {
\ 'autoload' : { 'unite_sources' : [ 'outline' ] }}
NeoBundleLazy 'basyura/unite-rails', {
\ 'autoload' : {
\   'unite_sources' : [
\     'rails/bundle', 'rails/bundled_gem', 'rails/config',
\     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
\     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
\     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
\     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
\     'rails/stylesheet', 'rails/view'
\   ]
\ }}

NeoBundleLazy 'alpacatc/alpaca_tags', {
\ 'depends': 'Shougo/vimproc',
\ 'autoload' : {
\   'commands': ['AlpacaTagsUpdate', 'AlpacaTagsSet', 'AlpacaTagsBundle']
\ }}

NeoBundleLazy 'taichouchou2/vim-endwise.git', {
\ 'autoload' : {'insert' : 1, } }

NeoBundleLazy 'vim-ruby/vim-ruby', { 
\ 'autoload' : { 'filetypes' : ['ruby', 'eruby'] }}

NeoBundleLazy 'tpope/vim-rails', { 
\ 'autoload' : { 'filetypes' : ['ruby', 'eruby'] }}

NeoBundleLazy 'thinca/vim-scouter', {
\ 'autoload': {'commands': 'Scouter'} }

" ゲーム
NeoBundleLazy 'thinca/vim-threes', {
\ 'autoload': { 'commands': 'ThreesStart' }}

NeoBundle 'thinca/vim-quickrun'
"------------------------------------
"
" syntax / indent
"NeoBundle 'slim-template/vim-slim'
"NeoBundle '2072/PHP-Indenting-for-VIm' " php indent
"NeoBundle 'vim-scripts/php.vim--Hodge' " php syntax
"NeoBundle 'tpope/vim-markdown'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'JulesWang/css.vim'
"NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-ref'
 
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'lilydjwg/colorizer'

NeoBundle 'scrooloose/syntastic'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'glidenote/memolist.vim'
"NeoBundle 'mileszs/ack.vim'

"NeoBundle 'violetyk/neocomplete-php.vim'
"
" unite plugin
 
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"NeoBundle 'errormarker.vim'
NeoBundle 'matchit.zip'
"NeoBundle 'taglist.vim'

 
" color
" NeoBundle 'w0ng/vim-hybrid'


" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" ...
"
call neobundle#end()

"文字コードの自動認識
"vimrcで文字コードの自動認識が設定されていないとき有効にする。
"encode.vimを読み込む
"source $CFGHOME/macros/encode.vim
"mswin.vimを読み込む
"source $VIMRUNTIME/mswin.vim
"behave mswin

"if has("win32")
"  let &termencoding = &encoding
"endif
"set encoding=utf-8
"set fileencodings=utf-8,cp932,euc-jp


"pluginを使用可能にする
filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------------------------
" Encoding:"{{{
"
" The automatic recognition of the character code.

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
set encoding=utf-8

" Setting of terminal encoding."{{{
if !has('gui_running')
  if &term ==# 'win32' &&
        \ (v:version < 703 || (v:version == 703 && has('patch814')))
" Setting when use the non-GUI Japanese console.

" Garbled unless set this.
    set termencoding=cp932
" Japanese input changes itself unless set this. Be careful because the
" automatic recognition of the character code is not possible!
    set encoding=japan
  else
    if $ENV_ACCESS ==# 'linux'
      set termencoding=euc-jp
    elseif $ENV_ACCESS ==# 'colinux'
      set termencoding=utf-8
    else " fallback
      set termencoding= " same as 'encoding'
    endif
  endif
elseif s:is_windows
" For system.
  set termencoding=cp932
endif
"}}}

" The automatic recognition of the character code."{{{
if !exists('did_encoding_settings') && has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

" Does iconv support JIS X 0213?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

" Build encodings.
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'ucs-2le'
    let &fileencodings = &fileencodings . ',' . 'ucs-2'
  endif
  let &fileencodings = &fileencodings . ',' . s:enc_jis

  if &encoding ==# 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'cp932'
  elseif &encoding =~# '^euc-\%(jp\|jisx0213\)$'
    let &encoding = s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'cp932'
  else " cp932
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
  endif
  let &fileencodings = &fileencodings . ',' . &encoding

  unlet s:enc_euc
  unlet s:enc_jis

  let did_encoding_settings = 1
endif
"}}}

if has('kaoriya')
" For Kaoriya only.
  set fileencodings=guess
endif

" When do not include Japanese, use encoding for fileencoding.
function! s:ReCheck_FENC() "{{{
  let is_multi_byte = search("[^\x01-\x7e]", 'n', 100, 100)
  if &fileencoding =~# 'iso-2022-jp' && !is_multi_byte
    let &fileencoding = &encoding
  endif
endfunction"}}}

autocmd MyAutoCmd BufReadPost * call s:ReCheck_FENC()

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac

" Command group opening with a specific character code again."{{{
" In particular effective when I am garbled in a terminal.
" Open in UTF-8 again.
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
" Open in iso-2022-jp again.
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
" Open in Shift_JIS again.
command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++enc=cp932 <args>
" Open in EUC-jp again.
command! -bang -bar -complete=file -nargs=? Euc edit<bang> ++enc=euc-jp <args>
" Open in UTF-16 again.
command! -bang -bar -complete=file -nargs=? Utf16 edit<bang> ++enc=ucs-2le <args>
" Open in UTF-16BE again.
command! -bang -bar -complete=file -nargs=? Utf16be edit<bang> ++enc=ucs-2 <args>

" Aliases.
command! -bang -bar -complete=file -nargs=? Jis Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis Cp932<bang> <args>
command! -bang -bar -complete=file -nargs=? Unicode Utf16<bang> <args>
"}}}

" Tried to make a file note version."{{{
" Don't save it because dangerous.
command! WUtf8 setlocal fenc=utf-8
command! WIso2022jp setlocal fenc=iso-2022-jp
command! WCp932 setlocal fenc=cp932
command! WEuc setlocal fenc=euc-jp
command! WUtf16 setlocal fenc=ucs-2le
command! WUtf16be setlocal fenc=ucs-2
" Aliases.
command! WJis WIso2022jp
command! WSjis WCp932
command! WUnicode WUtf16
"}}}

" Appoint a line feed."{{{
command! -bang -complete=file -nargs=? WUnix
      \ write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos
      \ write<bang> ++fileformat=dos <args> | edit <args>
command! -bang -complete=file -nargs=? WMac
      \ write<bang> ++fileformat=mac <args> | edit <args>
"}}}

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif
"}}}


"テンポラリファイル/バックアップファイル保存場所。
"ネットワーク上のファイル編集が遅いとき、ローカルに設定すると改善される場合がある。
"if has('win32')
"  set directory=$TMP
"  set backupdir=$TMP
"endif
"バックアップ/スワップファイルを作成する/しない。
set nobackup
set noswapfile
set noundofile " .un~
if has("vms")
  set nobackup
endif
"ファイルの上書きの前にバックアップを作らない。
"(backup がオンでない限り、いずれにせよ上書き前のバックアップは上書きに成功した後削除される)
set nowritebackup
"viminfoを作成する/しない。
"set viminfo=
"クリップボードを共有。
set clipboard+=unnamed
"grep,tagsのためカレントディレクトリ設定。
"set autochdir
"8進数を無効にする。<C-a>,<C-x>などに影響する。
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)。
set timeoutlen=3500
"新しいバッファを開くときにメッセージを出さない。
set hidden
"ヒストリの保存数
set history=200
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする。
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定。
"set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする。
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする。
if exists('&ambiwidth')
  set ambiwidth=double
endif
"コマンドライン補完するときに強化されたものを使う。
set wildmenu

"マウスを有効にする。
if has('mouse')
  set mouse=a
  " For screen.
  if &term =~ "^screen"
    augroup MyAutoCmd
      autocmd VimLeave * :set mouse=
    augroup END

    " screenでマウスを使用するとフリーズするのでその対策
    set ttymouse=xterm2
  endif

  if has('gui_running')
    " Show popup menu if right click.
    set mousemodel=popup

    " Don't focus the window when the mouse pointer is moved.
    set nomousefocus
    " Hide mouse pointer on insert mode.
    set mousehide
  endif
endif


"ctags を再帰的に読み込む？
set tags+=tags;

"----------------------------------------
" 表示設定
"----------------------------------------
"gvimの色テーマは.gvimrcで指定する。
"colorscheme mycolor
"スプラッシュ(起動時のメッセージ)を表示しない。
"set shortmess+=I
"音を鳴らさない＆画面更新の抑制。
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない。
set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
"set shellslash
"行番号表示
set nonumber
"括弧の対応表示時間
set showmatch matchtime=1
"タブを設定
"set ts=4 sw=4 sts=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"自動的にインデントする (noautoindent:インデントしない)
"set autoindent
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent

"Cインデントの設定
set cindent
"set cinoptions+=:

"set nosmartindent

"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=1
" タブバーを常に表示
set showtabline=2
"コマンドをステータス行に表示
set showcmd
"タイトルを表示
set title
"ステータスラインに表示
set laststatus=2
let &statusline = '%t%m%r%h%w%=%y[%{&fileencoding},%{&ff}][%l/%L]'

"Tabキー、行末の半角スペースを明示的に表示する。
set list
set listchars=eol:¬,tab:»- 


"画面最後の行をできる限り表示する。
set display=lastline
" ハイライトを有効にする。
if &t_Co > 2 || has('gui_running')
  syntax on
  set hlsearch
  if !has('gui_running') && (&term =~ "xterm" || &term =~ "screen" || &term =~ "rxvt-256color")
    "colorscheme luciusmod
    "colorscheme hybrid
    colorscheme luciusmod
    set t_Co=256
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
  endif
endif

"----------------------------------------
" 検索
"----------------------------------------
" 検索の時に大文字小文字を区別しない。
" 大文字小文字の両方が含まれている場合は大文字小文字を区別。
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
"set wrapscan
set nowrapscan
"インクリメンタルサーチ
set incsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal
"set grepprg=ack\ -a

" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

"diffの設定
if has('win32')
  set diffexpr=MyDiff()
  function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
endif

"現バッファの差分表示(変更箇所の表示)。
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif

set patchexpr=MyPatch()
function! MyPatch()
   :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

" vimgrep時にQuickFixを自動で開く
au QuickfixCmdPost vimgrep cw

"----------------------------------------
" ノーマルモード
"----------------------------------------
"ヘルプ検索
nnoremap <F1> K
"現在開いているvimスクリプトファイルを実行。
nnoremap <F8> :source %<CR>
"強制全保存終了を無効化。
nnoremap ZZ <Nop>
"カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
"キーボードマクロには論理行移動を推奨。
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 保存
nnoremap <silent><Space>w :<C-u>up<CR>

" grep
nnoremap <Space>g :<C-u>vimgrep /hoge/j **/* \| cw

" スクリプト設定
" GNU screen likeなキーバインド
let mapleader =""

nnoremap <Leader>n :<C-u>bn!<CR>
nnoremap <Leader>p :<C-u>bp!<CR>
nnoremap <Leader>d :<C-u>bd<CR>
nnoremap <Leader>l :<C-u>ls<CR>
"nnoremap <Leader><C-t> :<C-u>tabnew<CR>
nnoremap <Leader><C-w> :<C-u>tabclose<CR>

"----------------------------------------
" 挿入モード
"----------------------------------------

"----------------------------------------
" ビジュアルモード
"----------------------------------------

"vnoremap p <Esc>:let current_reg = @*<CR>gvc<C-R>=current_reg<CR><Esc>:let @* = current_reg<CR>

" クリップボードを認識しない
"vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>:let @" = current_reg<CR>
" 末尾でのペーストに問題あり
vnoremap p "_xP
"----------------------------------------
" コマンドモード
"----------------------------------------
nnoremap / /\v
"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""
"全角スペース、タブ、行末のスペースを表示
""""""""""""""""""""""""""""""
if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
    "全角スペースを明示的に表示する。
    "コメント以外で全角スペースを指定しているので、scriptencodingと、
    "このファイルのエンコードが一致するよう注意！
    match ZenkakuSpace /　/
  endfunction

  augroup InvisibleIndicator
    autocmd!
"    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" ------------------------------------------
" ファイルタイプ毎の設定
" ------------------------------------------
"
"autocmd FileType html,xhtml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


"----------------------------------------
" 各種プラグイン設定
"----------------------------------------

""""""""""""""""""""""""""""""
"Kaoriya版に添付されているプラグインの無効化
"問題があるものもあるので一律に無効化します。
"ファイルを参照(コメント部分で gf を実行)した上で、必要なプラグインは
"let plugin_..._disableの設定行をコメント化(削除)して有効にして下さい。
""""""""""""""""""""""""""""""
"{{{
"$VIMRUNTIME/plugin/autodate.vim
let plugin_autodate_disable  = 1
"$VIMRUNTIME/plugin/cmdex.vim
let plugin_cmdex_disable     = 1
"$VIMRUNTIME/plugin/dicwin.vim
let plugin_dicwin_disable    = 1
"$VIMRUNTIME/plugin/format.vim
let plugin_format_disable    = 1
"$VIMRUNTIME/plugin/hz_ja.vim
let plugin_hz_ja_disable     = 1
"$VIMRUNTIME/plugin/scrnmode.vim
let plugin_scrnmode_disable  = 1
"$VIMRUNTIME/plugin/verifyenc.vim
let plugin_verifyenc_disable = 1
"}}}

" plugin/yankRing.vim
"set viminfo+=!
"nmap ,y :YRShow<CR>
"nnoremap <silent> <Space>y :<C-u>YRShow<CR>

" vim-ruby/vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType ruby,eruby let g:rubycomplete_rails=1
autocmd FileType ruby,eruby let g:rubycomplete_include_object=1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace=1

" syntax/php.vim
let g:php_folding = 1
let g:php_sql_query = 1

" indent/php.vim
"let g:PHP_vintage_case_default_indent = 1

if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()


  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

  "neocomplete-php
  "let g:neocomplete_php_locale = 'ja'

elseif neobundle#is_installed('neocomplcache')
  " plugin/neocomplcache.vim 
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif


  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete



" macros/cd.vim 
"source $CFGHOME/macros/cd.vim
"au   BufEnter *   execute ":lcd " . expand("%:p:h") 

" plugin/neosnippet
let g:neosnippet#snippets_directory = $CFGHOME.'/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" plugin/taglist.vim
"map <silent><Space>t :<C-u>TlistToggle<CR>
"let g:tlist_php_settings = 'php;c:class;d:constant;f:function'
"let Tlist_Use_Right_Window = 1

" plugin/unite.vim
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
    let g:unite_source_history_yank_enable =1  "history/yankの有効化

    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
        nmap <buffer> <ESC> <Plug>(unite_exit)
        nnoremap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    endfunction

    if executable('ag')
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
        let g:unite_source_grep_recursive_opt = ''
    else
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt=''
    endif
endfunction

nnoremap <silent><C-f><C-b>   :<C-u>Unite buffer<Return>
nnoremap <silent><C-f><C-h>   :<C-u>Unite file_mru -buffer-name=files<Return>
nnoremap <silent><C-f><C-f>   :<C-u>UniteWithBufferDir file  -buffer-name=files<Return>
nnoremap <silent><C-f><C-t>   :<C-u>Unite tab<Return>
nnoremap <silent><C-f><C-g>   :<C-u>Unite outline<Return>
nnoremap <silent><C-f><C-l>   :<C-u>Unite bookmark<Return>
nnoremap <silent><C-p>        :<C-u>Unite history/yank<CR>

autocmd BufEnter *
    \ if empty(&buftype)
    \| nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord tag<CR>
    \| endif

autocmd FileType vimfiler call unite#custom_default_action('directory', 'lcd')

" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" vimfiler
let s:bundle = neobundle#get('vimfiler')
function! s:bundle.hooks.on_source(bundle)
  " ココにvimfilerの設定とか記述する。
  let g:vimfiler_enable_auto_cd = 1
endfunction
nnoremap <silent><Space>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" plugin/NERD_tree.vim
"nnoremap <silent><Space>f :NERDTreeToggle<CR>

" plugin/NERD_commenter.vim
nnoremap <silent><Space>c <plug>NERDCommenterToggle

" plugin/zencoding.vim
let g:user_zen_expandabbr_key = '<C-q>'
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\ 'lang' : 'ja',
\ 'html' : {
\   'filters' : 'html',
\   'indentation' : ' '
\ },
\ 'php' : {
\   'extends' : 'html',
\   'filters' : 'html,c',
\ },
\ 'css' : {
\   'filters' : 'fc',
\ },
\ 'javascript' : {
\   'snippets' : {
\     'jq' : "$(function() {\n\t${cursor}${child}\n});",
\     'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
\     'fn' : "(function() {\n\t${cursor}\n})();",
\     'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
\   },
\ },
\}

" plugin/memolist.vim

let g:memolist_path = "E:/Dropbox/private/memo"
let g:memolist_unite        = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-start-insert"

" メモ一覧をUniteで呼び出すコマンド
command! -nargs=0 MemoList2 :execute('Unite file:' . g:memolist_path . ' -buffer-name=memo_list -auto-preview')
" メモ一覧をUnite grepするコマンド
"command! -nargs=0 MemoGrep2 :Unite grep:~/My\ Documents/Dropbox/private/memo -no-quit
" メモ一覧をVimFilerで呼び出すコマンド
"command! -nargs=0 MemoFiler2 :VimFiler ~/My\ Documents/Dropbox/private/memo

" メモ関連マッピング
nnoremap <silent>Mn :MemoNew<CR>
nnoremap <silent>MN :MemoNew<CR>
nnoremap <silent>Ml :MemoList2<CR>
nnoremap <silent>ML :MemoList2<CR>
"nnoremap Mf :MemoFiler<CR>
"nnoremap MF :MemoFiler<CR>

"nnoremap Mg :MemoGrep<CR>
"nnoremap MG :MemoGrep<CR>


" scrooloose/syntastic
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2
let g:syntastic_auto_loc_list=1

""" ref.vim
let g:ref_php_encoding = 'utf8'
let g:ref_phpmanual_path = $CFGHOME.'/refs/php'
nmap ,rp :<C-u>Unite ref/phpmanual<CR>



let s:bundle = neobundle#get('neomru.vim')
function! s:bundle.hooks.on_source(bundle)
    let g:neomru#time_format = "(%Y/%m/%d %H:%M:%S) "
endfunction

"" quickrun
let s:bundle = neobundle#get('vim-quickrun')
function! s:bundle.hooks.on_source(bundle)
    let g:quickrun_config={
                \    '_': {
                \        'split': '',
                \        "runner" : "vimproc",
                \        "runner/vimproc/updatetime" : 60
                \    },
                \    'R': {
                \        "hook/output_encode/enable" : 1,
                \        "hook/output_encode/encoding" : "SJIS",
                \    }
                \}
endfunction


nnoremap <C-C> <ESC>

"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
    nnoremap <buffer><C-F><C-v>       :<C-U>Unite rails/view<CR>
    nnoremap <buffer><C-F><C-m>       :<C-U>Unite rails/model<CR>
    nnoremap <buffer><C-F><C-C>       :<C-U>Unite rails/controller<CR>

    nnoremap <buffer><C-F>c           :<C-U>Unite rails/config<CR>
    nnoremap <buffer><C-F>s           :<C-U>Unite rails/spec<CR>
    nnoremap <buffer><C-F>m           :<C-U>Unite rails/db -input=migrate<CR>
    nnoremap <buffer><C-F>l           :<C-U>Unite rails/lib<CR>
    nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
    nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
    nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
    "nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
    "nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
    au User Rails call UniteRailsSetting()
aug END
"}}}

"" =======================================
"" Find Motions
"" =======================================
"" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
"" `s{char}{char}{target}`
"nmap s <Plug>(easymotion-s2)
"xmap s <Plug>(easymotion-s2)
"omap z <Plug>(easymotion-s2)
"" Of course, you can map to any key you want such as `<Space>`
"" map <Space>(easymotion-s2)
"
"" Turn on case sensitive feature
"let g:EasyMotion_smartcase = 1
"
"" =======================================
"" Line Motions
"" =======================================
"" `JK` Motions: Extend line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"" keep cursor column with `JK` motions
"let g:EasyMotion_startofline = 0
"
"" =======================================
"" General Configuration
"" =======================================
"let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
"" Show target key with upper case to improve readability
"let g:EasyMotion_use_upper = 1
"" Jump to first match with enter & space
"let g:EasyMotion_enter_jump_first = 1
"let g:EasyMotion_space_jump_first = 1
"
"
"" =======================================
"" Search Motions
"" =======================================
"" Extend search motions with vital-over command line interface
"" Incremental highlight of all the matches
"" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
"" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
"" :h easymotion-command-line
"nmap g/ <Plug>(easymotion-sn)
"xmap g/ <Plug>(easymotion-sn)
"omap g/ <Plug>(easymotion-tn)


" vim:set et ts=2 sts=2 sw=2

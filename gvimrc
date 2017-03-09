"----------------------------------------
" システム設定
"----------------------------------------
scriptencoding utf8
"音を鳴らさない＆画面更新の抑制
set noerrorbells
set novisualbell
set visualbell t_vb=

if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キー
    "set imactivatekey=C-space
  endif
endif

"----------------------------------------
" 表示設定
"----------------------------------------
" 英語メニュー
"set langmenu=en
" ツールバーを非表示
set guioptions-=T
" コマンドラインの高さ
set cmdheight=1

" カラー設定:
"colorscheme xoria256
"colorscheme molokai
"colorscheme desert 
"colorscheme wombat
"colorscheme wombat256
"colorscheme wombat256mod
colorscheme luciusmod
"colorscheme codeschool
"colorscheme lucius
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme twilight
"
" フォント設定
set linespace=1
if has('win32')
  "set guifont=MS_Gothic:h11:cSHIFTJIS
  "set guifontwide=MS_Gothic:h11:cSHIFTJIS
  "set guifont=VL_Gothic:h10:cSHIFTJIS
  "set guifontwide=VL_Gothic:h10:cSHIFTJIS

  "set guifont=BDF_UM+:h9:cSHIFTJIS
  "set guifontwide=BDF_UM+:h9:cSHIFTJIS

  " M+
  "set guifont=BDF_M+:h9:cSHIFTJIS
  "set guifontwide=BDF_M+:h9:cSHIFTJIS

  "set guifont=BDF東雲ゴシック:h9:cSHIFTJIS
  "set guifontwide=BDF東雲ゴシック:h9:cSHIFTJIS
  "set guifont=Dina:h8:cSHIFTJIS
  "set guifontwide=BDF東雲ゴシック:h9:cSHIFTJIS

  " Migu 1M
  set guifont=Migu_1M:h11
  set guifontwide=Migu_1M:h11

  set linespace=0
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  set guifontset=a14,r14,k14
  set linespace=0
else
endif

"メッセージの日本語化
let $LANG='ja'

""""""""""""""""""""""""""""""
" Window位置の保存と復帰
""""""""""""""""""""""""""""""
if 1 && has('gui_running')
  if has('unix')
    let s:infofile = '~/.vim/.vimpos'
  else
    let s:infofile = '~/_vimpos'
  endif

  function! s:WinPosSizeSave(filename)
    let saved_reg = @a
    redir @a
    winpos
    redir END
    let px = substitute(@a, '.*X \(\d\+\).*', '\1', '') + 0
    let py = substitute(@a, '.*Y \(\d\+\).*', '\1', '') + 0
    execute 'redir! >'.a:filename
    if px > 0 && py > 0
      echo 'winpos '.px.' '.py
    endif
    echo 'set lines='.&lines.' columns='.&columns
    redir END
    let @a = saved_reg
  endfunction

  augroup WinPosSizeSaver
  autocmd!
  augroup END
  execute 'autocmd WinPosSizeSaver VimLeave * call s:WinPosSizeSave("'.s:infofile.'")'
  if filereadable(expand(s:infofile))
    execute 'source '.s:infofile
  endif
  unlet s:infofile
endif


"----------------------------------------
"----------------------------------------
" メニューアイテム作成
"----------------------------------------
"silent! aunmenu &File.Save
"silent! aunmenu &File.保存(&S)
"silent! aunmenu &File.差分表示(&D)\.\.\.

"let message_revert="再読込しますか?"
"amenu <silent> 10.330 &File.再読込(&U)<Tab>:e!  :if confirm(message_revert, "&Yes\n&No")==1<Bar> e! <Bar> endif<CR>
"amenu <silent> 10.331 &File.バッファ削除(&K)<Tab>:bd  :confirm bd<CR>
"amenu <silent> 10.340 &File.保存(&W)<Tab>:w  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
"amenu <silent> 10.341 &File.更新時保存(&S)<Tab>:update  :if expand('%') == ''<Bar>browse confirm w<Bar>else<Bar>confirm update<Bar>endif<CR>
"amenu <silent> 10.400 &File.現バッファ差分表示(&D)<Tab>:DiffOrig  :DiffOrig<CR>
"amenu <silent> 10.401 &File.裏バッファと差分表示(&D)<Tab>:Diff\ #  :Diff #<CR>
"amenu <silent> 10.402 &File.差分表示(&D)<Tab>:Diff  :browse vertical diffsplit<CR>

" vim:set et ts=2 sts=2 sw=2

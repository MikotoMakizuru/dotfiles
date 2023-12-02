""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" Gitを便利に使う
Plug 'tpope/vim-fugitive'
" Ruby向けにendを自動挿入
Plug 'tpope/vim-endwise'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
" 自動補完、コード分析、Linting、デバッグなどの機能を提供
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 非同期のコードチェックを行う
Plug 'dense-analysis/ale'

call plug#end()

" Tabキーで補完候補を選択できるようにする
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" coc.nvimとaleを連携
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1

" Required:
filetype plugin indent on

"===== 各種オプション設定 =====
" 行番号の表示
set number
" タブ、空白、改行を可視化
set list
" 編集中ファイル名の表示
set title
" ビープ音を視覚表示
set visualbell t_vb=
" ステータスを表示
set laststatus=2
" カーソル位置を表示
set ruler
" ○や□などの文字が重ならないようにする
set ambiwidth=double
" タブ文字の表示幅
set tabstop=2
 "コードに色をつける
syntax on

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

" Color scheme
syntax enable
set t_Co=256
colorscheme onedark

" Font
set guifont=HackGen35:h15
set nobackup

" no .un~ file
set noundofile

" 行番号の色
highlight LineNr guifg=gray

" ファイル内の <Tab> が対応する空白の数。
set tabstop=2

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=2
" インデントの各段階に使われる空白の数。
set shiftwidth=2
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set expandtab

" 入力されているテキストの最大幅。行がそれより長くなると、この幅を超えないように空白の後で改行される。値を 0 に設定すると無効になる。
set textwidth=0
" 新しい行を開始したとき (Insertモードで <CR> を打ち込むか、コマンド "o"や "O" を使ったとき)、新しい行のインデントを現在行と同じくする。（有効:autoindent/無効:noautoindent）
set autoindent
set smartindent

" オンのときは、ウィンドウの幅より長い行は折り返され、次の行に続けて表示される。（有効:wrap/無効:nowrap）
set wrap

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。（有効:wrapscan/無効:nowrapscan）
set wrapscan
" オンのとき、コマンドライン補完が拡張モードで行われる。（有効:wildmenu/無効:nowildmenu）
set wildmenu

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする。（有効:showmatch/無効:noshowmatch）
set showmatch

" 毎行の前に行番号を表示する。（有効:number/無効:nonumber）
set number
" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
set ruler
" 最下ウィンドウにいつステータス行が表示されるかを設定する。
"               0: 全く表示しない
"               1: ウィンドウの数が2以上のときのみ表示
"               2: 常に表示
set laststatus=2

"コロンセミコロン入れ変え for 英字配列キーボード
" noremap ; :
" noremap : ;

"view title
set title

"全角時赤色表示
if has('multi_byte_ime') || has('xim') 
  highlight Cursor guifg=NONE guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" インサートモード時にカーソルの形状変更
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" 文字が消せない問題
"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" cron
set backupskip=/tmp/*,/private/tmp/*


"dein setting
"--------------------------------------------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Yggdroot/indentLine')
call dein#add('mattn/emmet-vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('alvan/vim-closetag')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/syntastic')
call dein#add('posva/vim-vue')
call dein#add('prettier/vim-prettier')
call dein#add('scrooloose/nerdtree')
call dein#add('elzr/vim-json')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"--------------------------------------------------------------

"plugin setting
"--------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#lock_iminsert = 1
let g:neocomplete#auto_completion_start_length = 3
" Use smartcase.
" let g:neocomplcache_enable_smart_case = 1

" Indnet Line
set list listchars=tab:\¦\
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
"let g:indentLine_faster = 1

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim
let g:vim_json_syntax_conceal = 0
"--------------------------------------------------------------

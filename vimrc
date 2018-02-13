"""""""""""""""""""""""""""""""""
" Program: VIMRC V1.0
" Author:Clumart.G
" Date: 2013-10-30
" Update:None
"""""""""""""""""""""""""""""""""
" => General Options "{{{ 

" Session blank,buffers,curdir,folds,help,options,tabpages,winsize :help ssop
set sessionoptions-=curdir
set sessionoptions+=sesdir

" 当前行横线并取消高亮当前列
set cursorline
set nocursorcolumn

" 使用非兼容模式
set nocompatible  

" 设置文字编码自动识别
" the encode of terminal screen
set termencoding=utf-8
"file open and write encode
set fileencoding=utf-8
"encode in vim work space,should same as locale of your system #vim内部使用的编码，如寄存器，缓冲区等
set encoding=utf-8
" 文件编码 
set fileencodings=utf-8,gb2312,gbk,gb18030,big-5,ucs-bom,ucs,latin1


" 有关搜索的选项
set hlsearch
"实时显示当前界面的第一个匹配字符串
set incsearch   
set noic
"set ic smartcase 

" 输入的命令显示出来
set showcmd

" 历史记录行数
set history=1000

" 当文件在外部被修改时，自动读取(GUI);autowrite  autowriteall
set autoread 

" 一直启动鼠标(GUI),很少使用GUI模式,因此关闭
" set mouse=a

" 设置mapleader
let mapleader = ";"
let g:mapleader = ";"

" 快速重载配置文件
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>

" 当.vimrc被修改时，重载之
autocmd! bufwritepost vimrc source ~/.vimrc 

" 自动跳转到上一次打开的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal! g'\"" |
			\ endif 


"}}} 
" => Colors and Fonts "{{{ 

"t_co must before colorscheme
set t_Co=256

" 语法高亮
syntax enable
"use vim default setting
"syntax on

" 设置vim的配色方案
"colorscheme desert
"Next 6 lines is for peaksea plugin
if ! has("gui_running") 
    set t_Co=256 
endif 
" feel free to choose :set background=light or dark for a different style 
set background=dark
colors peaksea

" 字体
"set gfn=Vera\ Sans\ YuanTi\ Mono:h10
"set gfn=Droid\ Sans\ Fallback:h10
set guifont=Consolas\ DejaVu\ Sans\ YuanTi\ Mono\ 10

" GUI
if has("gui_running")
	set guioptions-=T
	let psc_style='cool'
endif 

" 折叠相关 indent syntax 
set foldmethod=marker
"}}}
" => DIY的一些语法高亮"{{{
"define myself Highlight
hi MySyntaxHighlight1 ctermbg=Red ctermfg=Green 
syntax region MySyntax1 start='???' end='???'
hi def link MySyntax1 MySyntaxHighlight1
match MySyntaxHighlight1 '???'
" Test line:  ??? >...< ???
"}}} 
" => other UI options"{{{
" Tab缩进
set smarttab
set tabstop=4 
set expandtab 

" 自动缩进 
set smartindent 
set shiftwidth=4
set autoindent 
" C language  indent style
" set cindent    

" 显示行号
set number 

" 显示光标位置 
set ruler 

" wild菜单 on vim command line ,it's support tab auto Padded
set wildmenu 

" 上下移动时，留3行;keep 3 lines on the top and bottom
set so=3

" set backspace;eol:support del up line direct,need start option;start support del code before direct;indent support del tab indent direct;
set backspace=eol,start,indent

" Backspace and cursor keys wrap to;support auto next line
" 如果使用l键向右时希望自动转入下一行,则添加l即可
set whichwrap+=<,>,h

" set magic on;$^.* needn't / in  Regular Expressions 
set magic 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" 括号匹配
set showmatch 

" How many tenths of a second to blink
set mat=5

" 状态栏set 2 is mean show the statusline all the time
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/peter', "~/", "g")
	return curdir
endfunction
" set the info on the statusline
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ [TYPE=%Y]\ %{strftime(\"[%m-%d\ %H:%M]\")}\ %=Pos:\ %l/%L:%c\ %p%%\ 

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 命令窗口大小
set cmdheight=1
"}}}
" => Files "{{{
" 启动文件类型插件
" enable file type detect
filetype on
" enable file type plugin for Grammar can highlight
filetype plugin on 
" enable file indent for different type
filetype indent on 

" 文件类型
" Auto detect file format unix or dos
set ffs=unix,dos
" ff is set file to the format and nmap is a shortcut
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" 不备份文件
" set nobackup
" set nowritebackup
" 自动备份文件
" set backup enable and the bakcup store dir
set backup
set writebackup
set backupdir=~/.vim/backup/,~/backup/,~/tmp/,./.vim/bakcup/,./backup/,./tmp/,./

set swapfile
set dir=~/.vim/backup/,~/backup/,~/tmp/,./.vim/bakcup/,./backup/,./tmp/,./
"}}}
" => Plugins "{{{
" 语法自动补齐
set completeopt=longest,menu

" for taglist
" F10 Open/Close Tlist window
nmap <F10> :TlistToggle <CR> 
"Set ctags path
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"if the console doesn't support auto width,then set this to 0
let Tlist_Inc_Winwidth=1
"set tlist on the right side
let Tlist_Use_Right_Window=1
"if tlist is the last window,then close vim.
let Tlist_Exit_OnlyWindow = 1
"if tag file > 2 ;then close other files ,only show tag file.
let Tlist_File_Fold_Auto_Close=1 

"NRED Tree Setting
nmap <F9> :NERDTreeToggle <CR> 

" MiniBufExpl 
nmap <F4> :MiniBufExplorer<cr> :UMiniBufExplorer<cr>
" use ctrl-hjkl to change window
let g:miniBufExplMapWindowNavVim = 1
" use ctrl - up down left right to change window
let g:miniBufExplMapWindowNavArrows = 1
" use ctrl - tab to change window ;or ctrl + shift + tab to change window backwards
let g:miniBufExplMapCTabSwitchBufs = 1
" open buffer file in edit window,except like tlist window 
let g:miniBufExplModSelTarget = 1

" SuperTab Setting
" set tab='press what' ;defatul ctrl+p ; onmi ctrl+x or ctrl+o
" I think use AutoComplete is better than this.
" let g:SuperTabDefaultCompletionType="<C-P>"

" for AutoComplete
" The auto-popup is not enabled at startup if this is non-zero.But i test it's faild!!!
let g:AutoComplPop_NotEnableAtStartup = 1

nmap <F10> :AutoComplPopEnable
nmap <C-F10> :AutoComplPopDisable

" for ctags
" add system include Files tags
set tags+=~/.vim/systags 
set tags=tags;
set autochdir
"nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS

" for echofunc
" set the echofunc file type
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
" Quick Install echofunc
"nmap <C-F9> :!ctags -R --fields=+lS
"}}}
" => 快捷键"{{{
" Buffer 
set hidden
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bb :b#<cr> 
nmap <leader>bls :buffers<cr>
nmap <leader>b1 :b1<cr>
nmap <leader>b2 :b2<cr>
nmap <leader>b3 :b3<cr>
nmap <leader>b4 :b4<cr>
nmap <leader>b5 :b5<cr>
nmap <leader>b6 :b6<cr>
nmap <leader>b7 :b7<cr>
nmap <leader>b8 :b8<cr>
nmap <leader>b9 :b9<cr> 

"mZ: mark Z ; -R recursive Dir -n show linenum ; cword :the word of under cursor; 
"copn:Open a window to show the current list of errors.
"nmap <F3> :vimgrep <cword> **/*.cpp **/*.h<cr> :copen <cr>
"nmap <F3> mZ :grep -Rn <cword> **/*.cpp **/*.c **/*.h **/*.java 2>/dev/null<cr><cr> :copen <cr>
nmap <F3> mZ :grep -Rn <cword> ./ 2>/dev/null<cr><cr> :copen <cr> 

"%f filename  %l linenum %m errormesaage
set grepformat=%f:%l:%m

"}}}

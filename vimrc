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

" 高亮当前行并取消高亮当前列
set cursorline
set nocursorcolumn

" 使用非兼容模式
set nocompatible  

" 设置文字编码自动识别
set fencs=utf-8,gb18030 
"set enc=utf-8

" 有关搜索的选项
set hls
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

" 一直启动鼠标(GUI)
set mouse=a

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
syntax on

" 设置vim的配色方案
"set background=dark
"colors peaksea 
"colorscheme wombat
colorscheme desert

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
" => other UI options"{{{
" Tab缩进
set smarttab
set tabstop=4 
set expandtab 

" 自动缩进 
set smartindent 
set shiftwidth=4
set autoindent 
set cindent 

" 显示行号
set number 

" 显示光标位置 
set ruler 

" wild菜单 
set wildmenu 

" 上下移动时，留3行
set so=3

" set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" set magic on 
set magic 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" 括号匹配
set showmatch 

" How many tenths of a second to blink
set mat=2

" 状态栏
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/peter', "~/", "g")
	return curdir
endfunction
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 命令窗口大小
set cmdheight=1
"}}}
" => Files "{{{
" 文件编码 
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big-5,ucs,latin1

" 启动文件类型插件
filetype on 
filetype plugin on 
filetype indent on 

" 文件类型
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" 不备份文件
set nobackup
set nowritebackup
"}}}
" => MISC"{{{
"}}}
" => Plugins "{{{
" 自动完成 
set completeopt=longest,menu

" for taglist
nmap <F10> :TlistToggle <CR> 
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1 

nmap <F9> :NERDTreeToggle <CR> 

" MiniBufExpl 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

nmap <F4> :MiniBufExplorer<cr> :UMiniBufExplorer<cr>

" SuperTab


" for AutoComplete
"let g:AutoComplPop_NotEnableAtStartup = 1
"nmap <F10> :AutoComplPopEnable
"nmap <C-F10> :AutoComplPopDisable

" for echofunc
set tags+=~/.vim/systags 
"nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS
"nmap <C-F9> :!ctags -R --fields=+lS
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
"}}}
" => DIY的一些语法高亮"{{{
"hi Mark ctermbg=Red ctermfg=Green 
"syntax region unKnown start='???' end='???'
"hi def link unKnown Mark
" Test line:  ??? >...< ???
"match Mark '???'
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

"nmap <F3> :vimgrep <cword> **/*.cpp **/*.h<cr> :copen <cr>
"nmap <F3> mZ :grep -Rn <cword> **/*.cpp **/*.c **/*.h **/*.java 2>/dev/null<cr><cr> :copen <cr>
nmap <F3> mZ :grep -Rn <cword> ./ 2>/dev/null<cr><cr> :copen <cr> 
set grepformat=%f:%l:%m
"set grepprg=

"}}}

set tags=tags;
set autochdir

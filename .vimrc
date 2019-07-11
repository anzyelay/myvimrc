"=========================================================================
"description: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分
"
" Version: 1.80
"
"=========================================================================
if filereadable(expand("~/.vim/vimrc.bundles"))
	"filetype plugin indent on " 开启插件
	source ~/.vim/vimrc.bundles
endif
" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置<Leader>,不设置默认为"\"
let mapleader = ","
syntax on " 自动语法高亮
set nu " 显示行号
set rnu 
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)

" 配色方案
set background=dark
if has('gui_running')
	colorscheme zenburn
else
	" colorscheme zenburn
	" colorscheme solarized
	colorscheme molokai
endif
" vim-powerline美化状态,设置在状态行显示的信息
let g:airline_theme='zenburn'
"airline 安装字体后必须设置 
let g:airline_powerline_fonts = 1 
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1 "顶部tab显示
"设置tab键映射"
nmap <tab> :bn<cr>  
let g:airline#extensions#tabline#buffer_nr_show = 1

" 括号匹配高亮
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0


" 可视化缩进
let g:indent_guides_enable_on_vim_startup = 1  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
set foldmethod=indent " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=99 " 设置折叠层数为
set foldclose=all " 设置为自动关闭折叠
"nnoremap <Space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  " 用空格键来开关折叠


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
	if has("win16") || has("win32") || has("win64") || has("win95")
		return "windows"
	elseif has("unix")
		return "linux"
	endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
	let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
	let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
	set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
	" UTF-8 编码
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk

	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif

	if has("win32")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Buffers操作快捷方式!

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ws <C-w>= 
nnoremap <leader>wh <C-w>_
nnoremap <leader>ww <C-w><Bar>

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

" set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>



" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab softtabstop=4 textwidth=90 fileformat=unix autoindent
autocmd FileType python map <F5> :w<CR>:!python3 %<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

"a.vim
nnoremap <F4> :A<CR>

"cscope 
nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>



" tagbar标签导航
nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let g:jedi#auto_initialization = 1

"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactyComs=1 " 多行注释时样子更好看

"YCM设置 
let g:ycm_min_num_of_chars_for_completion = 3   "开始补全的字符数"
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_auto_trigger = 1   "turn on
let g:ycm_confirm_extra_conf = 0

"自动加载cscope.out
map <F12> :call LoadCscope()<CR>
function! LoadCscope()
    " if (g:iswindows==1)
        " if (executable("cscope") && has("cscope"))
            " let UpperPath = findfile("cscope.out", ".;")
            " if (!empty(UpperPath))
                " let path = strpart(UpperPath, 0, match(UpperPath, "cscope.out$") - 1)
                " if (!empty(path))
                    " let s:CurrentDir = getcwd()
                    " let direct = strpart(s:CurrentDir, 0, 2)
                    " let s:FullPath = direct . path
                    " let s:AFullPath = globpath(s:FullPath, "cscope.out")
                    " let s:CscopeAddString = "cs add " . s:AFullPath . " " . s:FullPath
                    " execute s:CscopeAddString
                " endif
            " endif
        " endif
    " else
       let db = findfile("cscope.out", ".;")
       if (!empty(db))
         let path = strpart(db, 0, match(db, "/cscope.out$"))
         set nocscopeverbose " suppress 'duplicate connection' error
         exe "cs add " . db . " " . path
         set cscopeverbose
       endif
    " endif
endfunction

"markdown setting
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
let g:instant_markdown_open_to_the_world = 0
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_mathjax = 1
" edit binary file
augroup Binary
  au!
  au BufReadPre  *.{bin,ko,exe} let &bin=1
  au BufReadPost *.{bin,ko,exe} if &bin | %!xxd
  au BufReadPost *.{bin,ko,exe} set ft=xxd | endif
  au BufWritePre *.{bin,ko,exe} if &bin | %!xxd -r
  au BufWritePre *.{bin,ko,exe} endif
  au BufWritePost *.{bin,ko,exe} if &bin | %!xxd
  au BufWritePost *.{bin,ko,exe} set nomod | endif
augroup END

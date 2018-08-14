" vundle settings {{{
	" 设置包括vundle和初始化的runtiome path
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'

	if filereadable('~/.vim/.vimrc.bundles')
		source ~/.vim/.vimrc.bundles
	endif

	call vundle#end()
	filetype plugin indent on
" }}}


""" vim options {{{
	let mapleader=";"
	" 定义快捷键关闭当前分割窗口
	nmap <Leader>q :q<CR>
	nmap <Leader>1 :q!<CR>
	" 定义快捷键保存当前窗口内容
	nmap <Leader>w :w<CR>
	nmap <Leader>x :x<CR>
	nmap <Leader>h <C-w>w
	nmap <Leader>m :nohl<CR>
	" 设置快捷键将选中文本块复制至系统剪贴板
	vnoremap <Leader>y "+y
	" 设置快捷键将系统剪贴板内容粘贴至 vim
	nmap <Leader>p "+p
	" 让配置变更立即生效
	autocmd BufWritePost $MYVIMRC source $MYVIMRC

	"   -----------  基础设置  -----------

	" 关闭vim对vi特性的兼容，vim新特性更适合我们，
	" set nocompatible

	" 启动的时候不显示那个援助乌干达儿童的提示
	set shortmess=atI   
	" 设置当文件被改动时自动载入
	set autoread

	" 开启文件类型检测，但Vundle插件要求关闭该选项
	filetype off

	" 高亮当前行和列
	set cursorline
	set cursorcolumn
	" 颜色
	# colorscheme joit
	" 开启语法高亮
	if has("syntax")
		syntax on
		let python_highlight_all=1
	endif

	" 代开屏幕左侧的行号显示
	set number

	" 在屏幕右下角显示未完成的指令输入
	set showcmd

	" 上下移动光标时，光标的上方或下方至少保留显示的行数
	set scrolloff=3

	" indent, eol, start 代表的意思是 缩进位置， 行结束符， 段首，
	" 这样设置可以使得backspace键在这三个特殊的位置也能进行回删动作
	set backspace=indent,eol,start

	" 显示匹配的括号
	set showmatch

	" 打开搜索高亮模式
	set hlsearch

	" smarttab要和后面的shiftwidth配合使用，它只作用于行首位置
	" 当smarttab开启时，在行首键入<TAB>会填充shiftwidth设定的值，
	" 在其他地方则填充tabstop设定的值
	" set smarttab

	" 打开自动缩进
	set autoindent
	set smartindent "智能缩进"
	set cindent "C语言风格缩进"

	" shiftwidth定义了每一次缩进对应的空格数，当你使用自动格式化(比如gq)，
	" 或者手动缩进(<<和>>)时，vim使用的数值就是这个
	set shiftwidth=4

	" tabstop就是<TAB>字符所代表的空格数， 
	" 一般我们会用expandtab把<TAB>转变为空格符，然后键入<TAB>时就会产生 
	" tabstop个空格了 
	set tabstop=4

	" 将<TAB>符号转变为<SPACE>，也就是空格 set expandtab

	" 总是把softtabstop设定成和tabstop一样的数值，这样无论是用<TAB>插入缩进
	" 还是用<BS>删除缩进，其行为总是一样的
	set softtabstop=4

	" list开启对于制表符(tab)，行尾空格符(trail)，行结束符(eol)等等特殊符号
	" 的回显
	"set list listchars=eol:¬,tab:▸\ ,trail:.

	" 代码折叠设置
	" Enable folding
	set foldmethod=indent
	set foldlevel=99
	nnoremap <space> za	" Enable folding with the <space>

	" 禁止生成临时文件
	set nobackup
	set noswapfile

" }}}

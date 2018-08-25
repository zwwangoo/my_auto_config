" vundle settings {{{
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'

    if filereadable(expand('$HOME/.vim/vimrc.bundles'))
        source $HOME/.vim/vimrc.bundles
    endif


    call vundle#end()

    filetype indent on

    " filetype plugin on

" }}}

" vim map {{{
    let mapleader=";"
    nmap <Leader>q :q<CR>
    nmap <Leader>1 :q!<CR>
    nmap <Leader>w :w<CR>
    nmap <Leader>x :x<CR>
    nmap <Leader>h <C-w>w
    nmap <Leader>m :nohl<CR>
    vnoremap <Leader>y "+y
    nmap <Leader>p "+p
	nmap <Leader>s :Gblame<CR>
" }}}

" vim options {{{
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    set shortmess=atI   
    set autoread

    filetype off

    set cursorline
    set cursorcolumn

	if filereadable(expend('$HOME/.vim/colors/jellybeans.vim'))
		colorscheme jellybeans
	endif

    if has("syntax")
        syntax on
        let python_highlight_all=1
    endif
    set number
    set showcmd
    set scrolloff=3
    set backspace=indent,eol,start
    set showmatch
    set hlsearch
    set autoindent
    set smartindent 
    set cindent
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set foldmethod=indent
    set foldlevel=99
	nnoremap <space> za	" Enable folding with the <space>
    set nobackup
    set noswapfile
    " set mouse=a
    " set selection=exclusive
    " set selectmode=mouse,key
    set autowrite
    set encoding=utf-8
" }}}

" fcitx-auto {{{
    "##### auto fcitx  ###########
    let g:input_toggle = 1
    function! Fcitx2en()
       let s:input_status = system("fcitx-remote")
       if s:input_status == 2
          let g:input_toggle = 1
          let l:a = system("fcitx-remote -c")
       endif
    endfunction
    
    function! Fcitx2zh()
       let s:input_status = system("fcitx-remote")
       if s:input_status != 2 && g:input_toggle == 1
          let l:a = system("fcitx-remote -o")
          let g:input_toggle = 0
       endif
    endfunction
    
    set ttimeoutlen=150
    autocmd InsertLeave * call Fcitx2en()
    " autocmd InsertEnter * call Fcitx2zh()
    "##### auto fcitx end ######
" }}}

" au BufNewFile,BufRead *.py
"     \ set tabstop=4 |
"     \ set softtabstop=4 |
"     \ set shiftwidth=4 |
"     \ set autoindent |
"     \ set fileformat=unix
" 
" au BufNewFile,BufRead *.js, *.html, *.css, *.yml
"     \ set tabstop=2 |
"     \ set softtabstop=2 |
"     \ set shiftwidth=2
" 

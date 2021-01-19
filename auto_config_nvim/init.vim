" vim map {{{
    let mapleader=";"
    nmap <leader>q :q<CR>
    nmap <leader>1 :q!<CR>
    nmap <leader>w :w<CR>
    nmap <leader>x :x<CR>
    nmap <leader>h <C-w>w
    nmap <leader>m ::nohl<CR>
    nmap <leader>t :new term://zsh<CR>
    " 复制命令的结果
    nmap <leader>r :read! 

    " 权限不足
    nmap <leader>2 :w !sudo tee %<CR>

    " sudo apt install xclip
    vnoremap <Leader>y "+y
    nnoremap <Leader>p "+p

    " yf拷贝当前文件名，yp拷贝完整文件路径
    nnoremap yf :let @"=expand("%:t")<CR>
    nnoremap yp :let @"=expand("%:p")<CR>
    nnoremap <space> za    " Enable folding with the <space>
" }}}

" plugin {{{
    if filereadable(expand('$HOME/.config/nvim/vimrc.bundles'))
        source $HOME/.config/nvim/vimrc.bundles
    endif

    filetype plugin indent on
" }}}
"
" basic {{{
    set cursorline
    set cursorcolumn
    set relativenumber " 相对行号
	" For Neovim 0.1.3 and 0.1.4
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 
    " Or if you have Neovim >= 0.1.5
    if (has("termguicolors"))
      set termguicolors
    endif
    
	if filereadable(expand('$HOME/.config/nvim/colors/jellybeans.vim'))
        colorscheme jellybeans
    endif

	" if filereadable(expand('$HOME/.config/nvim/plugged/oceanic-next/colors/OceanicNext.vim'))
    "     colorscheme OceanicNext
    " endif

    if has("syntax")
        syntax on
        let python_highlight_all=1
    endif

    set number
    set showcmd
    set scrolloff=18
    set showmatch
    set hlsearch
    set smartindent
    set cindent
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set foldmethod=indent
    set foldlevel=99
    set nobackup
    set noswapfile
    set notermguicolors
    " set mouse=a
    " set selection=exclusive
    " set selectmode=mouse,key
	" if has("autocmd")
    "     au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " endif
" }}}

" {{{
"   au BufNewFile,BufRead *.py, *.sh
"       \ set tabstop=4 |
"       \ set softtabstop=4 |
"       \ set shiftwidth=4 |
"       \ set autoindent |
"       \ set fileformat=unix
"
"   au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml
"       \ set tabstop=2 |
"       \ set softtabstop=2 |
"       \ set shiftwidth=2
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
    
    set ttimeoutlen=10
    autocmd InsertLeave * call Fcitx2en()
    " autocmd InsertEnter * call Fcitx2zh()
    "##### auto fcitx end ######
" }}}

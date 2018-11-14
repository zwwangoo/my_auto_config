" plugin {{{
	if filereadable(expand('$HOME/.config/nvim/vimrc.bundles'))
		source $HOME/.config/nvim/vimrc.bundles
	endif
	filetype plugin indent on
	call neomake#configure#automake('nrwi', 500)

" }}}

" vim map {{{
    let mapleader=";"
    nmap <leader>q :q<CR>
    nmap <leader>1 :q!<CR>
    nmap <leader>w :w<CR>
    nmap <leader>x :x<CR>
    nmap <leader>h <C-w>w
    nmap <leader>m ::nohl<CR>

    vnoremap <Leader>y "+y
    nmap <Leader>p "+p

    nmap <Leader>f :NERDTreeToggle<CR>
    nmap <Leader>s :Gblame<CR>
    nnoremap <C-f> :CtrlSF<Space>
    inoremap <C-c> <ESC>
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	nmap sp :lprev<CR>
	nmap sn :lnext<CR>

" }}}

"
" basic {{{
    set cursorline
    set cursorcolumn
    colorscheme jellybeans
    if has("syntax")
        syntax on
        let python_highlight_all=1
    endif
    set number
    set showcmd
    set scrolloff=18
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
    nnoremap <space> za    " Enable folding with the <space>
    set nobackup
    set noswapfile
    " set mouse=a
    " set selection=exclusive
    " set selectmode=mouse,key
    set autowrite
    set autoread
    set encoding=utf-8
	if has("autocmd")
	    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	set t_ti= t_te=
endif
" }}}

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.yml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

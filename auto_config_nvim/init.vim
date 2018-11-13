" plugin {{{
call plug#begin('~/.local/share/nvim/plugged')

	Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'

call plug#end()

" }}}

    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9, 
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

" vim map {{{
    let mapleader=";"
    nmap <leader>q :q<CR>
    nmap <leader>1 :q!<CR>
    nmap <leader>w :w<CR>
    nmap <leader>x :x<CR>
    nmap <leader>h :<C-w>w
    nmap <leader>m ::nohl<CR>

    vnoremap <Leader>y "+y
    nmap <Leader>p "+p

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

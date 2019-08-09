call plug#begin('/home/wen/.config/nvim/plugged')

" Auto Complete {{{

    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-github'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-jedi'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-markdown-subscope'
    Plug 'ncm2/ncm2-tmux'


    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANTE: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    let g:python_host_prog='/home/wen/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog='/home/wen/.pyenv/versions/neovim3/bin/python'

    set shortmess+=c
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    let ncm2#popup_delay = 5
    let ncm2#complete_length = [[1, 1]]

" }}}

" nerdtree {{{
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nmap <Leader>f :NERDTreeToggle<CR>
    let NERDTreeShowLineNumbers=1
    let NERDTreeMinimalUI=1
    let NERDTreeAutoCenter=0
    let NERDTreeShowHidden=0
    let NERDTreeWinSize=31
    let NERDTreeShowBookmarks=1
    let NERDTreeMouseMode=2
    let NERDTreeIgnore=['\.pyc$', '\~$', '\.idea', '__pycache__', '\.git$']
    let NERDTreeShowHidden=1
    let NERDTreeAutoDeleteBuffer=1
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : ">",
        \ "Staged"    : "+",
        \ "Untracked" : "-",
        \ "Renamed"   : "$",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "x",
        \ "Dirty"     : "*",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
" }}}

" python {{{

    Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
    Plug 'neomake/neomake'
    Plug 'nvie/vim-flake8'
    Plug 'w0rp/ale'
    Plug 'tell-k/vim-autopep8'
    let g:neomake_python_enabled_makers = ['flake8']
    let g:autopep8_on_save = 0
    let g:autopep8_disable_show_diff=1
    autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

    let b:ale_linters = ['flake8']
    nmap sp <Plug>(ale_previous_wrap)
    nmap sn <Plug>(ale_next_wrap)

" }}}

" other {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tmhedberg/SimpylFold'
    Plug 'kien/ctrlp.vim'
    let g:ale_sign_column_always = 1
    set laststatus=2
    " set t_Co=256
    let g:airline_powerline_fonts=1
    let g:airline_theme='cool'
    let g:airline_left_sep='>'
    let g:nerdtree_tabs_open_on_gui_startup=1
    let g:SimpyFold_docstring_preview=1
" }}}

" vim-fugitive {{{  git log
    Plug 'tpope/vim-fugitive'
    nmap <Leader>s :Gblame<CR>
" }}}

" {{{
    " 搜索
    Plug 'dyng/ctrlsf.vim'
    nmap <C-f> :CtrlSF<Space>
" }}}
" {{{ Bookmarks
    Plug 'kshenoy/vim-signature'
    let g:SignatureMap = {
        \ 'Leader'             :  "z",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

    Plug 'mileszs/ack.vim'
    Plug 'zxqfl/tabnine-vim'

" {{{ vim-wakatime  about https://wakatime.com/vim
    Plug 'wakatime/vim-wakatime'
" }}}

" {{{ 自动引号&括号补全
    Plug 'jiangmiao/auto-pairs'
    " 快速注释
    Plug 'scrooloose/nerdcommenter'
	" python函数跳转
	Plug 'davidhalter/jedi-vim'
	let g:jedi#completions_enabled = 0  " 不使用自动补全
	let g:jedi#use_splits_not_buffers = "winwidth" " 打开窗口在top left right bottom
	let g:jedi#goto_definitions_command = ""  " 默认的 <leader>s 键和vim-fugitive的键冲突，所以不设置
" }}}
call plug#end()

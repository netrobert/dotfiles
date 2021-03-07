" ~/.config/nvim/init.vim

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'

call plug#end()

let g:python_highlight_all = 1

" Visuals
set number
set ruler

let g:lightline = {
      \ 'colorscheme': 'jellybeans'
      \ }

" Features
syntax on
set magic
filetype plugin on
filetype indent on

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Backspaces
set backspace=eol,start,indent

" Brackets
set showmatch

" Mouse
set mouse=a

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Hide tildes
highlight EndOfBuffer ctermfg=0 ctermbg=0

" Colours
highlight Comment ctermbg=0 ctermfg=7
highlight String ctermbg=0 ctermfg=6
highlight Character ctermbg=0 ctermfg=3
highlight Number ctermbg=0 ctermfg=1
highlight Boolean ctermbg=0 ctermfg=1
highlight Float ctermbg=0 ctermfg=1
highlight Function ctermbg=0 ctermfg=4
highlight Statement ctermbg=0 ctermfg=5
highlight Operator ctermbg=0 ctermfg=5
highlight Type ctermbg=0 ctermfg=5
highlight PreProc ctermbg=0 ctermfg=5
highlight Keyword ctermbg=0 ctermfg=6
highlight LineNr ctermbg=0 ctermfg=7

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_show_hidden = 1

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Nerdtree
map <silent> <C-n> :NERDTreeFocus<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

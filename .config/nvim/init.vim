call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'

call plug#end()

syntax on

set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.cache/nvim/undo
set undofile
set incsearch
set termguicolors
set cmdheight=2
set updatetime=50

colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark = 'hard'
let mapleader = " "
nnoremap <C-z> :wq<CR>
inoremap <C-z> <esc>:wq<CR>
nnoremap <leader><leader><leader> :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>

autocmd BufWritePre * :call TrimWhitespace()

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'

call plug#end()

syntax on
set mouse=a
set clipboard+=unnamedplus
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.cache/nvim/undo
set undofile
set incsearch
set termguicolors
set cmdheight=2
set updatetime=50
set splitbelow splitright
set wildmode=longest,list,full

colorscheme gruvbox
set background=dark
set cursorline
set cursorcolumn

let g:gruvbox_contrast_dark = 'hard'
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 20

nnoremap <C-z> :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><leader><leader> :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <A-s> :%s//gI<Left><Left><Left>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <F2> :Lexplore <CR>

inoremap <C-z> <esc>:wq<CR>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'

call plug#end()

syntax on
set mouse=a
set guicursor=
set clipboard+=unnamedplus
set scrolloff=5
set hidden
set noerrorbells
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set number relativenumber
set nu rnu
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set shortmess+=c
set signcolumn=yes

setglobal commentstring=#\ %s
augroup comments
  autocmd!
  autocmd FileType c,cpp,cs,java,arduino setlocal commentstring=//\ %s
augroup END

colorscheme gruvbox
set background=dark
set cursorline
set cursorcolumn

let g:gruvbox_contrast_dark = 'hard'
let g:airline_theme = 'gruvbox_material'
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["bash", "php", "markdown", "yaml", "zsh", "vim", "typescript"],
    \ "passive_filetypes": ["perl"]}

nnoremap <C-z> :wq<CR>
nnoremap <C-w> :w<CR>
nnoremap <leader><leader><leader> :q!<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <A-s> :%s//gI<Left><Left><Left>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <F2> :Lexplore <CR>

inoremap <C-z> <esc>:wq<CR>
inoremap <C-w> <esc>:w<CR>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

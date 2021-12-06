"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~/\\\\\\\\\\~~~~~~~/\\\\\\\\\\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~\////////\\\~~~~~~\////////\\\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~\/\\\~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~/\\\~~~\/\\\~~~~~~/\\\~~~\/\\\~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~\//\\\\\\\\\~~~~~~\//\\\\\\\\\~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~\/////////~~~~~~~~\/////////~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=8
set tabstop=8
set hidden
set signcolumn=yes
set number
set termguicolors
set relativenumber
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:❧\ ,trail:∙
" set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set backup
set backupdir=~/.local/share/vim/backup/
set encoding=utf-8
set fileencoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"
nmap <leader>ve :edit ~/.vimrc<cr>
" nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.vimrc<cr>

map gf :edit <cfile><cr>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

nmap <leader>x :!xdg-open %<cr><cr>

imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = '~/.vim'
if empty(glob('~/.vim/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

source ~/.config/vim/plugins/airline.vim
source ~/.config/vim/plugins/coc.vim
source ~/.config/vim/plugins/commentary.vim
source ~/.config/vim/plugins/context-commentstring.vim
source ~/.config/vim/plugins/csapprox.vim
source ~/.config/vim/plugins/nord.vim
source ~/.config/vim/plugins/gruvbox.vim


call plug#end()
colorscheme nord
" doautocmd User PlugLoaded

set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" highlight! link SignColumn LineNr
highlight! SignColumn ctermbg=none guibg=background
highlight! Pmenu ctermbg=none guibg=background

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misceallaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

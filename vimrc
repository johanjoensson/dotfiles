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
nmap <leader>vr :source ~/.vimrc<cr>

map gf :edit <cfile><cr>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

xnoremap <TAB> >gv
xnoremap <S-TAB> <gv
xnoremap < <gv
xnoremap > >gv

nmap <leader>x :!xdg-open %<cr><cr>

imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = '~/.vim'
" Install plug if it is not already installed in the $data_dir/autoload folder
if empty(glob('~/.vim/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

call plug#begin(data_dir.'/plugged')

source ~/.config/vim/plugins/airline.vim
source ~/.config/vim/plugins/commentary.vim
source ~/.config/vim/plugins/context.vim
source ~/.config/vim/plugins/context-commentstring.vim
source ~/.config/vim/plugins/csapprox.vim
source ~/.config/vim/plugins/nord.vim
source ~/.config/vim/plugins/gruvbox.vim
source ~/.config/vim/plugins/undotree.vim
source ~/.config/vim/plugins/fugitive.vim
source ~/.config/vim/plugins/vim-tmux-navigator.vim
if !has('nvim')
        source ~/.config/vim/plugins/ale.vim
        source ~/.config/vim/plugins/ctrlp.vim
else
        source ~/.config/vim/plugins/lsp-zero.nvim
        source ~/.config/vim/plugins/treesitter.nvim
        source ~/.config/vim/plugins/telescope.nvim
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        set nofoldenable                     " Disable folding at startup.
endif
source ~/.config/vim/plugins/direnv.vim

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
if exists("$EXTRA_VIM")
        for path in split($EXTRA_VIM, ':')
                exec "source ".path
        endfor
endif

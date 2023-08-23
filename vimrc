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
call plug#begin('~/.vim/plugged')

source ~/.config/vim/plugins/airline.vim
source ~/.config/vim/plugins/commentary.vim
source ~/.config/vim/plugins/context-commentstring.vim
source ~/.config/vim/plugins/csapprox.vim
source ~/.config/vim/plugins/nord.vim
source ~/.config/vim/plugins/gruvbox.vim
source ~/.config/vim/plugins/undotree.vim
source ~/.config/vim/plugins/fugitive.vim
if !has('nvim')
        source ~/.config/vim/plugins/ale.vim
        source ~/.config/vim/plugins/ctrlp.vim
else
        source ~/.config/vim/plugins/treesitter.nvim
        source ~/.config/vim/plugins/telescope.nvim
endif

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
" if has('nvim')
" lua << EOF
"   vim.opt.rtp:append('/usr/share/vim/vimfiles')
" 
"   require'nvim-treesitter.configs'.setup {
"     -- A list of parser names, or "all" (the five listed parsers should always be installed)
"     ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc" },
" 
"     -- Install parsers synchronously (only applied to `ensure_installed`)
"     sync_install = false,
" 
"     -- Automatically install missing parsers when entering buffer
"     -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
"     auto_install = false,
" 
"     -- List of parsers to ignore installing (for "all")
"     ignore_install = { "javascript" },
" 
"     ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
"     -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
" 
"     highlight = {
"       enable = true,
" 
"       -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
"       -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
"       -- the name of the parser)
"       -- list of language that will be disabled
"       disable = { "c", "rust" },
"       -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
"       disable = function(lang, buf)
"           local max_filesize = 100 * 1024 -- 100 KB
"           local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
"           if ok and stats and stats.size > max_filesize then
"               return true
"           end
"       end,
" 
"       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"       -- Using this option may slow down your editor, and you may see some duplicate highlights.
"       -- Instead of true it can also be a list of languages
"       additional_vim_regex_highlighting = false,
"     },
"   }
" EOF
" endif

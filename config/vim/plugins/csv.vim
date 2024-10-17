Plug 'chrisbra/csv.vim'
autocmd BufWinEnter {imag,real}-*.dat set buftype=nowrite | :g!|^[#]|s/ \+/;/g | NewDelimiter ;

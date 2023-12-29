Plug 'dense-analysis/ale'

function! SmartInsertCompletion() abort
        if pumvisible()
                " Use the default CTRL-N in completion menus
                return "\<C-n>"
        elseif CheckBackSpace()
                " If at the beginning of a line, insert tab
                return "\<tab>"
        else
                " Exit and re-enter insert mode, and use insert completion
                return "\<C-c>a\<C-n>"
        endif
endfunction

inoremap <silent> <tab> <C-r>=SmartInsertCompletion()<CR>
inoremap <silent> <S-tab> <C-p>
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gt <Plug>(ale_go_to_type_definition)
nmap <silent> gi <Plug>(ale_go_to_implementation)
nmap <silent> gr <Plug>(ale_find_references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>k <Plug>(ale_hover)

" Symbol renaming.
nmap <leader>rn :ALERename<CR>
nmap <leader>rf :ALEFileRename<CR>

" Formatting selected code.
nmap <leader>f  :ALEFix<CR>
"
" Do default action for next item.
nnoremap <silent><nowait> <leader>n  :<C-u>ALENext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>b  :<C-u>ALEPrevious<CR>

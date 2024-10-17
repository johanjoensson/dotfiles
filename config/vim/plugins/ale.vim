Plug 'dense-analysis/ale'
let g:ale_completion_enabled = 1
set completeopt=menu,popup,noinsert,noselect
let g:ale_sign_warning='●'
let g:ale_sign_error='●'
hi ALEErrorSign ctermfg=red ctermbg=none
hi ALEWarningSign ctermfg=yellow ctermbg=none

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_list_vertical = 1
" ale_keep_list_window_open

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 0
" Run linter when opening file
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

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

Plug 'JuliaEditorSupport/julia-vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" julia
let g:default_julia_version = '1.8'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       server = LanguageServer.LanguageServerInstance(stdin, stdout,
\       env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> <leader>k :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gt :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> gi :call LanguageClient_textDocument_implementation()<CR>
nmap <silent> gr :call LanguageClient_textDocument_references()<CR>

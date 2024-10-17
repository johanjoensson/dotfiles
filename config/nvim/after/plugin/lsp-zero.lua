local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        --   -- to learn the available actions
        lsp.default_keymaps({buffer = bufnr, omit = {'K'}})
        vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
        vim.keymap.set({'n', 'x'}, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
end)
-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
 lsp.setup_servers({'rust_analyzer', 'pylsp'})

-- " (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
cmp.setup({
        mapping = {
                ['<cr>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                print("VISIBLE")
                                cmp.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                        else
                                fallback()
                        end
                end),
                ['<tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif vim.fn.CheckBackSpace() then
                                fallback()
                        else
                                cmp.complete()
                        end
                end),
                ['<S-tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        else
                                fallback()
                        end
                end),
        }
})     

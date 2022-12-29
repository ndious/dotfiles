local status, lsp = pcall(require, 'lsp-zero')

if (not status) then
    print 'lsp-plugin is missing please run :PackerSync'
    return
end

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'cssls',
    'rust_analyzer',
    'gopls',
})

-- lsp.nvim_workspace()
lsp.setup()


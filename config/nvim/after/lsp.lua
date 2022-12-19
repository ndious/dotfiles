local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'solargraph',
    'cssls',
    'rust_analyzer',
    'gopls',
})

-- lsp.nvim_workspace()
lsp.setup()


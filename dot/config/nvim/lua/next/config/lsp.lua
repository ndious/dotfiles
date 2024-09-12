local lsp_zero = require "lsp-zero"
local lsp = require "lspconfig"
local cmp = require "cmp"
local lspkind = require "lspkind"

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.preset("recommended")

require("neodev").setup {}
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver",
        "eslint",
        "cssls",
        "rust_analyzer",
        "gopls",
        "lua_ls",
        "pyright",
        "yamlls",
        "jsonls",
    },

    handlers = {
        lsp_zero.default_setup,
    },
}

lsp.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace"
            }
        }
    }
}


native_lsp = {
    enabled = true,
    virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
    },
    inlay_hints = {
        background = true,
    },
}

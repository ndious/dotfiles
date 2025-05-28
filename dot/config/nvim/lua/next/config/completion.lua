local lspkind = require "lspkind"
lspkind.init {}

local lsp_zero = require "lsp-zero"
local lsp = require "lspconfig"

local cmp = require "cmp"

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.preset("recommended")

cmp.setup {
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },

    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.SelectBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
    },

    snippet = {
        expand = function (args)
            require("luasnip").lsp_expand(args.body)
        end
    },
}

require("mason").setup({})
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver",
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

-- luasnip
-- Snippet auto-loading
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/next/snippets/*.lua", true)) do
    loadfile(ft_path)()
end

vim.keymap.set(
    { "i", "s" }, 
    "<c-k>",
    function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jumpable()
        end
    end,
    { silent = true }
)


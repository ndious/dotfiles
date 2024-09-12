return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            { "williamboman/mason-lspconfig.nvim", config = function() end },
        },
    }
}

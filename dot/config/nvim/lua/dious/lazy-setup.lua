local conf = {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        require("indent_blankline").setup {
            show_trailing_blankline_indent = true,
            show_first_indent_level = true,
            use_treesitter = true,
            show_current_context = true,
            buftypes_exclude = { "terminal", "quickfix" },
        }
    end
}


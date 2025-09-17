-- https://github.com/tronikelis/ts-autotag.nvim
return {{
    "tronikelis/ts-autotag.nvim",
    opts = {
        disable_in_macro = true,
        auto_close = {
            enable = true,
        },
    },
    -- ft = {}, optionally you can load it only in jsx/html
    event = "VeryLazy",
}}

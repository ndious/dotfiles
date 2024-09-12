return {
    {
        "windwp/nvim-ts-autotag",
        opts = {},
        config = function()
            local autotag = require "nvim-ts-autotag"

            autotag.setup {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            }
        end
    }
}

-- local hooks = require "ibl.hooks"

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
local colors = require "catppuccin.palettes.latte"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.flamingo })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.sky })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.peach })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.mantle })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.teal })
end)

require("ibl").setup { indent = { highlight = highlight } }

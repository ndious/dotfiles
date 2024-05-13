local telescope = require "telescope"

telescope.setup({
    extensions = {
        aerial = { -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
                ["_"] = false, -- This key will be the default
                json = true, -- You can set the option for specific filetypes
                yaml = true,
            },
        },
    },
})

telescope.load_extension('aerial')
telescope.load_extension('harpoon')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


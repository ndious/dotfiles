local status, builtin = pcall(require, "telescope.builtin")

if (not status) then
    print "Telescope Error"
    return
end

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>tg', function ()
    builtin.grep_string({ search = vim.fn.input("Grep >") })
end)



--[[
local status, telescope = pcall(require, "telescope")
if (not status) then
    print "Error Telescope"
    return
end

local actions = require "telescope.actions"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"

telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
                ["<CR>"] = actions.select_default,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})
]]--

-- require("telescope").load_extension("git_worktree")
-- telescope.load_extension("fzy_native")


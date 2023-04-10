local yml_status, yaml = pcall(require, 'yaml')
if not yml_status then
    print("Tod error, missing yaml-lua")
    return
end

local path_status, path = pcall(require, 'plenary.path')
if not path_status then return end

local root = vim.loop.cwd()
local git_root_path_cmd = "git rev-parse --show-toplevel"
local handle =  io.popen(git_root_path_cmd)
if handle ~= nil then
    local git_root = handle:read("a")
    handle:close()
    print(git_root)
end

local tod_dir = root .. "/.tod"
print(tod_dir)

local ns = vim.api.nvim_create_namespace "tod"
table.unpack = table.unpack or unpack

local f_open = io.open

local function read_file(f_path)
    local file = f_open(f_path,'rb')

    if not file then return nil end

    local content = file:read "*a"
    file:close()

    return content
end

-- read YML file
local f_content = read_file './test.yml'
print(f_content)

local data = yaml.eval(f_content)
print(data.todo)

-- Retrieve cursor position
local line, _ = table.unpack(vim.api.nvim_win_get_cursor(0))
print(line)

print(vim.fn.expand('%'))

vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
vim.api.nvim_buf_set_extmark(0, ns, line - 1, 0, {
    virt_text = {{ data.todo, "info" }},
    virt_text_pos = "eol",
    virt_lines = {{
        { "\tThis a virt_lines" , "error" }
    }},
    virt_lines_above = false,
    virt_lines_leftcol = false,
})


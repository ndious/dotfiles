-- Default options
local status, theme = pcall(require, "nightfox")

if (not status) then
    print "Nightfox not install"
    return
end

theme.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading

local function ColorMyNvim(scheme)
    scheme = scheme or "carbonfox"
    vim.cmd.colorscheme(scheme)
end

function LightScheme()
   ColorMyNvim("dayfox")
end

function DarkScheme()
    ColorMyNvim()
end

local function InitColor()
    local hour = os.date("%H")
    local h = tonumber(hour, 10)

    if (h < 9 or h > 19) then
       DarkScheme()
       return
    end

    LightScheme()
end

vim.api.nvim_create_user_command('N5DarkScheme', function()
    DarkScheme()
end, {})

vim.api.nvim_create_user_command('N5LightScheme', function()
    LightScheme()
end, {})

InitColor()


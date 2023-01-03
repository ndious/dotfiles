local wez = require 'wezterm'

return {
    -- Select lauch progran
    default_prog = { '/usr/bin/fish', '-l' },
    --[[
    window_frame = {
        font = wez.font { familly = 'Fira code', weight = 'Normal' },
        font_size = 14.0,
    },
    ]]--
    hide_tab_bar_if_only_one_tab = true,

    tab_bar_at_bottom = true,

    keys = {
        {
            key = 'r',
            mods = 'CTRL|SHIFT',
            action = wez.action.ReloadConfiguration,
        },
    },

    -- Theme 
}

local status, treesitter = pcall(require, "nvim-treesitter.configs")

if (not status) then
    print "Treesitter not available"
    return
end
print "Treesitter.cnf"

require("nvim-treesitter.configs").setup {
    ensure_installed = { 
        -- "lua", 
        "rust",
        "css",
        "html",
        "javascript",
        "ruby",
        "go",
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        disable = { "lua" },
    },
}


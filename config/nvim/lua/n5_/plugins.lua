-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local status, packer = pcall(require, "packer")

if (not status) then
    print "Packer is not installed"
    return
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Simple plugins can be specified as strings
--    use("tpope/vim-fugitive")

    -- [SECTION] telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    -- use("telescope-fzy-native.nvim")

    -- use({
        -- "nvim-lualine/lualine.nvim",
    -- })
    
    -- [SECTION] Lsp
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- [SUB] LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- [SUB] Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- [SUB] Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }

    -- [SECTION] Super-powers
    use("ThePrimeagen/harpoon")
    use("mbbill/undotree")

    -- [SECTION] Colorscheme section
    use {'srcery-colors/srcery-vim', as = 'srcery'}
    use 'folke/tokyonight.nvim'

    -- [SECTION] Colors
    use 'tjdevries/colorbuddy.vim'
    use 'rktjmp/lush.nvim'

    -- [SECTION] TreeSitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- use("nvim-treesitter/playground")
    -- use("romgrk/nvim-treesitter-context")

    -- use("mfussenegger/nvim-dap")
    -- use("rcarriga/nvim-dap-ui")
    -- use("theHamsta/nvim-dap-virtual-text")

end)

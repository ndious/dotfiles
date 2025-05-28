return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zidhuss/neotest-minitest",
  },
  confid = function()
      require("neotest").setup({
          adapters = {
              require "neotest-minitest"
          }
      })
  end
}


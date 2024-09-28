-- parser, and powerful module base on parser
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {"c", "cpp", "python", "javascript", "bash"},

      -- auto_install = true,
      sync_install = false,

      highlight = {
          enable = true,
        },

      indent = { 
        enable = true 
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<C-S-space>",
        },
      },

    })

  end,

}


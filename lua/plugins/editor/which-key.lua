-- keymap snippet

return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      
      whichkey = require("which-key")
      whichkey.setup({
        window = {
          border = "shadow",
          winblend = 10,
        },
        layout = {
          align = "center",
        },
      })

    end,
  }

  -- config = function()
  --   vim.o.timeout = true
  --   vim.o.timeoutlen = 300
  --   
  --   whichkey = require("which-key")
  --   whichkey.setup({
  --     window = {
  --       border = "shadow",
  --       winblend = 10,
  --     },
  --     layout = {
  --       align = "center",
  --     },
  --   })

  -- end,

}

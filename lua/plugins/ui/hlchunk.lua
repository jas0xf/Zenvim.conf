return {
  "shellRaining/hlchunk.nvim",
  -- event = { "UIEnter"},
  event = { "BufReadPre", "BufNewFile" },
  -- dependencies = {
  --   -- parser
  --   "nvim-treesitter/nvim-treesitter",
  -- },
  config = function()
    local hlchunk = require("hlchunk")

    hlchunk.setup({
      chunk = {
        enable = true,
        style = {
          "#3ddbd9", 
          "#c21f30"
        }
      },
      blank = {
        enable = false, 
        },
      indent = {
        enable = false, 
      }
    })

  end,
}

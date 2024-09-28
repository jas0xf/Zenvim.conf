-- markdown rendering
return {
  "OXY2DEV/markview.nvim",
    lazy = false,
    ft = {"markdown", "Avante"},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
    filetype = {"markdown", "Avante"},
  },
  config = function()
    require("markview").setup({
      modes = {"n", "i", "v","no","c"},

      headings = {
        heading_1 = {
          style = "label",
          padding_left = " ",
          padding_right = " ",

          corner_right = "",
          corner_right_hl = "MarkviewHeading1",

        }
      }
    })

  end,

}

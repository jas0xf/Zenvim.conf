-- show the color code's color

return {
  "norcalli/nvim-colorizer.lua",
  -- event = "VeryLazy",
  priority = 1, --not important
  config = function()
    require('colorizer').setup({
      '*', --all files
    })
  end
}

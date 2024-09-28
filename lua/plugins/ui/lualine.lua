return {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  -- event = "VeryLazy",
  -- priority = 1000,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local icons = require("nvim-web-devicons")
    icons.setup({
      color_icons = false;
    })


    local lualine = require("lualine")

    local colors = {
      blue = "#65D1FF",
      cyan = "82cfff",
      pink = "ff7eb6",
      green = "#08bdba",
      violet = "#be95ff",
      yellow = "#FFDA7B",
      red = "#ee5396",
      fg = "#c3ccdc",
      bg = "#111111",
      inactive_bg = "#2c3043",
    }

    local custom_theme = {
      normal = {
        a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
        b = { bg = "none", fg = colors.fg },
        c = { bg = "none", fg = colors.fg },
        x = { bg = "none", fg = colors.fg },
        y = { bg = "none", fg = colors.fg },
      },
      insert = {
        a = { bg = colors.pink, fg = colors.bg, gui = "bold" },
        b = { bg = "none", fg = colors.fg },
        c = { bg = "none", fg = colors.fg },
        x = { bg = "none", fg = colors.fg },
        y = { bg = "none", fg = colors.fg },
 
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = "none", fg = colors.fg },
        c = { bg = "none", fg = colors.fg },
        x = { bg = "none", fg = colors.fg },
        y = { bg = "none", fg = colors.fg },
      },
      command = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = "none", fg = colors.fg },
        c = { bg = "none", fg = colors.fg },
        x = { bg = "none", fg = colors.fg },
        y = { bg = "none", fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = "none", fg = colors.fg },
        c = { bg = "none", fg = colors.fg },
        x = { bg = "none", fg = colors.fg },
        y = { bg = "none", fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }
    
    lualine.setup({
      options = {
        theme = custom_theme,
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_x = {
          {"filetype"},
        }
      }
    })
  end,
}

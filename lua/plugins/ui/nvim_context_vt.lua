-- context virutal text
return {
  "andersevenrud/nvim_context_vt",
  config = function()
    lines = vim.o.lines
    require("nvim_context_vt").setup({
      -- min_rows = 25,
      min_rows = lines / 2,
      prefix = '',

    })
  end,

}

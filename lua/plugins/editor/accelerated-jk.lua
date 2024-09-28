-- faster jk motion when holding

return {
  "rainbowhxch/accelerated-jk.nvim",
  dependency = {
    "folke/zen-mode.nvim",
  },
  event = "VeryLazy",
  config = function()
    require('accelerated-jk').setup()
    vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {noremap = true})
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {noremap = true})
  end,
}

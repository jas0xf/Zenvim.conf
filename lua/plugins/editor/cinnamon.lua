-- -- smooth scroll

return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {
    keymaps = {
      basic = true,
      extra = true,
    }

  },

  config = function()
    vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {noremap = true})
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {noremap = true})
  end,

}

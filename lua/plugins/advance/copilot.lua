-- github copilot
return {
  "github/copilot.vim",

  config = function()
    -- require('copilot').setup {
    -- }
  vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
  vim.g.copilot_no_tab_map = true
  end,

}

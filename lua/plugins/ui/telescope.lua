-- a universal fuzzy finder with great ui (file, keymaps, highlightgroups...)

return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = { 
    'nvim-lua/plenary.nvim' 
  },
  config = function()

    local actions = require("telescope.actions")
    local custom_actions = {}
    custom_actions.select_tab_with_zen = function(prompt_bufnr)
      actions.select_tab(prompt_bufnr)
      vim.cmd("ZenMode")
    end

    telescope = require("telescope")
    telescope.setup({
      defaults = {
        initial_mode = "normal",
        mappings = {
          n = {
            -- ["<cr>"] = "select_tab",
            ["<cr>"] = custom_actions.select_tab_with_zen,
          },
          i = {
            -- ["<cr>"] = "select_tab",
            ["<cr>"] = custom_actions.select_tab_with_zen,
          }
        }
      },
    })
    
    vim.cmd[[
      " highlight TelescopeNormal guibg=NONE
      " highlight TelescopeBorder guifg=#3ddbd9 guibg=NONE
      "
      " highlight TelescopePromptBorder guifg=#3ddbd9 guibg=NONE
      " highlight TelescopePromptNormal guibg=NONE
    ]]
  end,
}

-- center code with zen mode

return {
  "folke/zen-mode.nvim",
  -- event = "VeryLazy",
    opts = {
      window = {
        backdrop = 1,
        width = function()
          local width = vim.fn.winwidth(0) * .50
          if width < 100 then
            return 100
          else
            return width
          end
        end,
    },
      plugins = {
        options = {
          laststatus = 3,
        }
      },

  },
  config = function()
      vim.cmd('highlight ZenBg guibg=#000000')
      vim.cmd('ZenMode')

      vim.api.nvim_create_autocmd("TabEnter", {
        callback = function()
          vim.cmd('ZenMode')
        end,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd('wincmd w')
        end,
      })

      vim.cmd('cabbrev wq wqa')
      vim.cmd('cabbrev q qa')
  end,
}

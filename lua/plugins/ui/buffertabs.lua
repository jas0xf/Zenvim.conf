-- tabline

return {
    'tomiis4/BufferTabs.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
    },
    event = "VeryLazy",
    config = function()
      require('buffertabs').setup({
          -- config
          -- ---@type string use hl Group or hex color
        -- hl_group = 'BufferTabsActive',

        ---@type string use hl Group or hex color
        -- hl_group_inactive = 'Comment',
      })

      vim.cmd("set showtabline=0")
      
      -- diable first
      require("buffertabs").toggle()
      
      function ToggleAndTabNext()
          require("buffertabs").toggle()
          vim.cmd('ZenMode')
          vim.cmd('tabnext')
          -- vim.cmd('ZenMode')

          vim.defer_fn(function()
            require("buffertabs").toggle()
          end, 800)
      end


      vim.api.nvim_set_keymap('n', '<leader><Tab>', [[<Cmd>lua ToggleAndTabNext()<CR>]], { noremap = true, silent = true })

      function QuitTab()
        local buffers = vim.api.nvim_list_bufs()

        -- Filter for valid and listed buffers
        for _, buf in ipairs(buffers) do
          if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
            print("Valid buffer:", buf)
          end
        end

        local total_tabs = vim.fn.tabpagenr('$')
        if total_tabs > 1 then
          vim.cmd('bd')
          return
        else 
          vim.cmd('wqa')
        end
      end

      vim.api.nvim_set_keymap('n', '<leader>q', [[<Cmd>lua QuitTab()<CR>]], { noremap = true, silent = true })


      function showTab() 
        require("buffertabs").toggle()

        vim.defer_fn(function()
          require("buffertabs").toggle()
        end, 800)
      end

      vim.api.nvim_exec([[
        autocmd TabNew * lua showTab()
      ]], false)

      vim.cmd[[
        
      ]]

    end

}

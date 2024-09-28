-- info about current obj in hover window
-- hovering mouse on LSP/dictionary to switch

return {
    "lewis6991/hover.nvim",
    event = "VeryLazy",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.jira')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                -- border = nil
                border = 'single'
            },
            preview_window = false,
            title = true,
            mouse_providers = {
              'LSP'
            },
            mouse_delay = 1000
        }
      vim.o.mousemoveevent = true


      -- official way 
      -- vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)"})

      local mouse_position = vim.fn.getmousepos()

      vim.keymap.set({'', 'i'}, '<LeftRelease>',function()
        -- local temp = vim.fn.getmousepos()
        -- if temp.line == mouse_position.line and temp.column == mouse_position.column then
        --   
        --   require("hover").hover()
        -- else
        --     mouse_position = temp
        -- end
      
        local temp = vim.fn.getmousepos()
        -- wait 1000 ms
        vim.defer_fn(function()
          local sample = vim.fn.getmousepos()
          if vim.deep_equal(sample, temp) then
            require("hover").hover()
          end
        end, 750)
        
      end , { noremap = true, silent = true })

    end
}

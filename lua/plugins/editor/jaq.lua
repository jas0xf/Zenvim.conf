-- code runner

return {
  "is0n/jaq-nvim",
  event = "VeryLazy",
  config = function()
  jaq = require('jaq-nvim')
  jaq.setup({
    cmds = {
      -- Uses vim commands
      internal = {
        lua = "luafile %",
        vim = "source %"
      },

      -- Uses shell commands
      external = {
        markdown   = "glow %",
        python     = "python3 %",
        cpp        = "g++ % -o /tmp/temp_exec && /tmp/temp_exec && rm /tmp/temp_exec",
        c        = "gcc % -o /tmp/temp_exec && /tmp/temp_exec && rm /tmp/temp_exec",
        go         = "go run %",
        sh         = "sh %",
        javascript = "npm start",
      },

    },

    behavior = {
        autosave = true,
    },

    ui = {
        float = {
          border = "rounded",
          winblend = 20,
        }
      }
  })

  vim.cmd[[
  
  cabbrev run Jaq<cr> "command line input 'run'
  nnoremap <leader>r <cmd>Jaq<cr>
  autocmd VimEnter * silent! autocmd User NotifyPre * if v:hlchunk_msg =~# 'no parser for Jaq' | return 1 | endif
  ]]

  end,
}

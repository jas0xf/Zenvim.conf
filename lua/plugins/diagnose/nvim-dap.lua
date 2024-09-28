return {
  "mfussenegger/nvim-dap",

  config = function()
    local dap = require("dap")

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)


    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg=0, fg='#dd3939', bg='NONE' })
    vim.fn.sign_define('DapBreakpoint', { text=' ', texthl='DapBreakpoint', linehl='', numhl='' })




    -- python
    dap.adapters.python = function(cb, config)
      if config.request == 'launch' then
        cb({
          type = 'executable',
          command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          }
        })
      else
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        })
      end
    end

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",

        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/.env/bin/python') == 1 then
            return cwd .. '/.env/bin/python'
          else
            return '/usr/bin/python'
          end
        end;      
      },
    }


    -- cpp
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        
          local source_file = vim.fn.expand('%:p')
          local output_file = '/tmp/nvim_dap_cpp_generated_tmp_exe_file'
          local compile_command = string.format('g++ %s -g -o %s', source_file, output_file)
          local compile_result = vim.fn.system(compile_command)
          
          if vim.v.shell_error ~= 0 then
            vim.notify('Compilation failed:\n'..compile_result, vim.log.levels.ERROR)
            return nil
          end
          return output_file

        end,
        cwd = '${workspaceFolder}',
        -- stopAtEntry = true,
      },
      -- {
      --   name = 'Attach to gdbserver :1234',
      --   type = 'cppdbg',
      --   request = 'launch',
      --   MIMode = 'gdb',
      --   miDebuggerServerAddress = 'localhost:1234',
      --   miDebuggerPath = '/usr/bin/gdb',
      --   cwd = '${workspaceFolder}',
      --   program = function()
      --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --   end,
      -- },
    }



  end,
}

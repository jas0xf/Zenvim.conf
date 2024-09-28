return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)

      -- change to vim.diagnostic.jump when nvim 0.11.0 is released
      keymap.set("n", "gl", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer
      keymap.set("n", "gL", vim.diagnostic.goto_prev) -- jump to previous diagnostic in buffer

      keymap.set("n", "gd", '<CMD>lua require("telescope.builtin").lsp_definitions({jump_type = "never"})<CR>') -- go to definition
      keymap.set("n", "gD", '<CMD>lua require("telescope.builtin").lsp_definitions({jump_type = "never"})<CR>') -- go to declaration
      keymap.set("n", "gr", '<CMD>lua require("telescope.builtin").lsp_references({jump_type = "never"})<CR>') -- go to references

    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- configure svelte server
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function(pattern)
            local util = require('lspconfig.util')
            local cwd = vim.loop.cwd()
            local root = util.root_pattern('__pycache__', 'venv', '.git', '.env')(pattern)

            if root == nil then
              return cwd
            end
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
    })

    -- configure c/cpp/... server
    lspconfig["clangd"].setup({
      capabilities = vim.tbl_deep_extend('force', capabilities, {
        offsetEncoding = { 'utf-16'},
        general = {
          positionEncoding = {'utf-16'},
        },
      }),
      on_attach = on_attach,
      root_dir = function(pattern)
            local util = require('lspconfig.util')
            local cwd = vim.loop.cwd()
            local root = util.root_pattern('.git')(pattern)

            if root == nil then
              return cwd
            end
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
    })

    -- php
    lspconfig["intelephense"].setup({
      init_options = {
        globalStoragePath = '/tmp/'
      },
      capabilities = capabilities,
      on_attach = on_attach,

      root_dir = function(pattern)
            local util = require('lspconfig.util')
            local cwd = vim.loop.cwd()
            local root = util.root_pattern('composer.json', '.git')(pattern)

            if root == nil then
              return cwd
            end
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
    })

    lspconfig["solidity_ls_nomicfoundation"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = function(pattern)
            local util = require('lspconfig.util')
            local cwd = vim.loop.cwd()
            local root = util.root_pattern('package.json', '.git')(pattern)

            if root == nil then
              return cwd
            end
            return util.path.is_descendant(cwd, root) and cwd or root
          end,
    })


  end,
}

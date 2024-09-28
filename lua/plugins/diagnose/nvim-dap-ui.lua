return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup()

    vim.api.nvim_set_keymap("n", "<leader>du", "<cmd>ZenMode<CR><cmd>lua require('dapui').toggle()<CR>", { noremap = true, silent = true })
  end,
}

-- file explorer on telescope

return {
  "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { 
    "nvim-telescope/telescope.nvim", 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- open file_browser with the path of the current buffer
    vim.api.nvim_set_keymap(
      "n",
      "<space>e",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true }
    )
  end,


}

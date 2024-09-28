return {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000, -- make it first load
    config = function()
        vim.cmd[[
          colorscheme oxocarbon

          highlight Normal guibg=NONE
          highlight SignColumn guibg=NONE
        ]]
    end,
}

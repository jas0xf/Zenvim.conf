-- markdown editor

return {
  'jakewvincent/mkdnflow.nvim',
  event = "VeryLazy",
  config = function()
    require('mkdnflow').setup()
  end,
}

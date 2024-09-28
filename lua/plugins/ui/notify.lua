-- notification custom

return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    notify = require("notify")
    notify.setup({
      top_down = false,
      background_colour = "#000000",
      render = "wrapped-compact",

    })
  end,
}

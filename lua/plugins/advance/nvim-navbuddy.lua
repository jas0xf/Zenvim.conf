-- popups breadcrumbs
return {
    "SmiteshP/nvim-navbuddy",
    after = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    },
    opts = { 
      window = {
        border = "rounded",
        sections = {
          right = {
          preview = "never",
        },
      },
    },
      lsp = { 
        auto_attach = true 
        } 
    },
    vim.keymap.set('n', '<leader>n', function()
        require("nvim-navbuddy").open()
      end, { desc = "Open NavBuddy" }),

    vim.api.nvim_set_hl(0, "NavicIconsFile", {default = true, bg = "NONE", fg = "#FF0000"}),
    vim.api.nvim_set_hl(0, "NavicIconsModule", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsNamespace", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsPackage", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsClass", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsMethod", {default = true, bg = "NONE", fg = "#ff7eb6"}),
    vim.api.nvim_set_hl(0, "NavicIconsProperty", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsField", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsConstructor", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsEnum", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsInterface", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsFunction", {default = true, bg = "NONE", fg = "#ff7eb6"}),
    vim.api.nvim_set_hl(0, "NavicIconsVariable", {default = true, bg = "NONE", fg = "#eeeeee"}),
    vim.api.nvim_set_hl(0, "NavicIconsConstant", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsString", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsNumber", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsBoolean", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsArray", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsObject", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsKey", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsNull", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsEnumMember", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsStruct", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsEvent", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsOperator", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIcons", {default = true, bg = "NONE", fg = "#78a9ff"}),
    vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "NONE", fg = "#78a9ff"}),


    
}

return {
  "folke/styler.nvim",
  config = function()
    require("styler").setup({
      themes = {
        markdown = { colorscheme = "catppuccin-macchiato" },
        lua = { colorscheme = "catppuccin-macchiato" },
        go = { colorscheme = "catppuccin-macchiato" },
      },
    })
  end,
}

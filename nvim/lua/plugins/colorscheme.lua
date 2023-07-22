return {
  -- add  onedarkpro
  { "olimorris/onedarkpro.nvim", priority = 1000 },

  -- Configure LazyVim to load onedarkpro
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}

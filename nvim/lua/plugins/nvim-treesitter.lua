-- return {
--   "nvim-treesitter/nvim-treesitter",
--   opts = function(_, opts)
--     -- add tsx and treesitter
--     vim.list_extend(opts.ensure_installed, {
--       "astro",
--       "bash",
--       "go",
--       "gomod",
--       "gowork",
--       "gosum",
--       "html",
--       "javascript",
--       "json",
--       "lua",
--       "markdown",
--       "markdown_inline",
--       "python",
--       "query",
--       "regex",
--       "tsx",
--       "typescript",
--       "vim",
--       "yaml",
--       "svelte",
--     })
--   end,
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "astro",
      "bash",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "svelte",
    })
    -- Ensure highlighting is explicitly enabled
    opts.highlight = opts.highlight or {}
    opts.highlight.enable = true -- This is the key line
  end,
  build = ":TSUpdate",
}

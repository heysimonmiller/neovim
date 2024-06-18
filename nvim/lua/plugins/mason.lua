return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettierd")
    vim.list_extend(
      opts.ensure_installed,
      { "goimports", "gofumpt", "gomodifytags", "impl", "delve", "svelte-language-server" }
    )
  end,
}

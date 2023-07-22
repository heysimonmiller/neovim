return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      for key, value in pairs(opts.sources) do
        if value == nls.builtins.formatting.prettierd then
          table.remove(opts.sources, key)
          table.insert(
            opts.sources,
            nls.builtins.formatting.prettierd.with({
              timeout = 4000,
              -- only run prettier when in a project with a prettier config
              condition = function(utils)
                local prettier = {
                  "prettier.config.js",
                  ".prettierrc",
                  ".prettierrc.json",
                  ".prettierrc.yaml",
                  ".prettierrc.yml",
                  ".prettierrc.js",
                }
                return utils.root_has_file(prettier)
              end,
              -- overwrite which files are checked
              -- filetypes = { "html", "css", "json", "yaml", "markdown", "typescriptreact" },
              -- pass arguments to pretier (in addition to prettierrc args)
              -- extra_args = { "--use-tabs", "--no-semi" },
            })
          )
        end
      end
    end,
  },
}

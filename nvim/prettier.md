if true then
  return {}
end

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local root_has_file = function(files)
      return function(utils)
        return utils.root_has_file(files)
      end
    end

    local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
    local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
    local stylua_root_files = { "stylua.toml", ".stylua.toml" }
    local elm_root_files = { "elm.json" }

    local opts = {
      eslint_diagnostics = {
        timeout = 10000,
        timeout_ms = 10000,
        condition = root_has_file(eslint_root_files),
      },
      prettier_formatting = {
        timeout = 10000,
        timeout_ms = 10000,
        extra_filetypes = { "markdown" },
        condition = root_has_file(prettier_root_files),
      },
      stylua_formatting = {
        timeout = 10000,
        timeout_ms = 10000,
        condition = root_has_file(stylua_root_files),
      },
      elm_format_formatting = {
        timeout = 10000,
        timeout_ms = 10000,
        condition = root_has_file(elm_root_files),
      },
    }

    local function on_attach(client, _)
      if client.server_capabilities.document_formatting then
        vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
        vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
      end
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d.with(opts.eslint_diagnostics),
        null_ls.builtins.formatting.prettier.with(opts.prettier_formatting),
        null_ls.builtins.formatting.stylua.with(opts.stylua_formatting),
        null_ls.builtins.formatting.elm_format.with(opts.elm_format_formatting),
        null_ls.builtins.code_actions.eslint_d.with(opts.eslint_diagnostics),
      },
      on_attach = on_attach,
    })
  end,
}

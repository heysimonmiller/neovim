return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}
    
    -- Configure ripgrep arguments to respect .gitignore
    opts.defaults.vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      -- NO --hidden flag here to respect .gitignore
      -- Additional explicit excludes
      "--glob", "!.git",
      "--glob", "!node_modules",
      "--glob", "!build",
      "--glob", "!.next",
      "--glob", "!dist",
    }
    
    -- Also use file_ignore_patterns for additional filtering
    opts.defaults.file_ignore_patterns = {
      "node_modules",
      "%.expo",
      "build",
      ".git",
      ".next",
      "dist",
      "%.lock",
    }
    
    -- Configure find_command to respect .gitignore
    opts.pickers = opts.pickers or {}
    opts.pickers.find_files = {
      hidden = false,  -- IMPORTANT: Override LazyVim's default hidden=true
      find_command = { 
        "rg", 
        "--files",
        "--glob", "!.git",
        "--glob", "!node_modules",
        "--glob", "!build",
        "--glob", "!.next",
        "--glob", "!dist",
      },
    }
    
    -- Fix for Astro files not highlighting when opened from Telescope
    opts.defaults.buffer_previewer_maker = function(filepath, bufnr, opts)
      require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
      -- Force filetype detection for Astro files
      if vim.fn.fnamemodify(filepath, ":e") == "astro" then
        vim.bo[bufnr].filetype = "astro"
      end
    end
    
    return opts
  end,
}

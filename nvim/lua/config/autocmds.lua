-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = augroup("highlight_yank"),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- local function format_hunks()
-- local hunks = require("gitsigns").get_hunks()
--   local format = require("conform").format
--   for i = #hunks, 1, -1 do
--     local hunk = hunks[i]
--     if hunk ~= nil and hunk.type ~= "delete" then
--       local start = hunk.added.start
--       local last = start + hunk.added.count
--       -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
--       local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
--       local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
--       format({ range = range })
--     end
--   end
-- end
--
-- -- Create an autocmd for format on save using git hunks
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     -- Disable LazyVim's default formatting for this buffer
--     vim.b[args.buf].autoformat = false
--     -- Format git hunks instead
--     format_hunks()
--   end,
-- })
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Expand ~/dev/teachme2 to full path
    local teachme2_path = vim.fn.expand("~/dev/teachme2")
    -- Get current file's full path
    local current_file = vim.fn.expand("%:p")
    -- Check if current file is under teachme2 path
    if string.sub(current_file, 1, string.len(teachme2_path)) == teachme2_path then
      vim.b.autoformat = false
    end
  end,
})

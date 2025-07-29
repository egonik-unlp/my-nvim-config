-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
--
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.bo.omnifunc = ""
  end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.rs",
  callback = function(args)
    local path = args.file
    if vim.fn.search("view!%s*{", "nw") ~= 0 then
      vim.bo.filetype = "rust_with_rstml"
    end
  end,
})

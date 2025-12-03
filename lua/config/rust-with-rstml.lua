vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust_with_rstml",
  callback = function()
    -- Map language to rust
    vim.treesitter.language.register("rust", "rust_with_rstml")

    -- Force parser start
    vim.defer_fn(function()
      local ok = pcall(vim.treesitter.start, 0, "rust")
      if ok then
        print("Attached rust Treesitter parser for rust_with_rstml buffer")
      else
        print("Failed to attach parser")
      end
    end, 50)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust_with_rstml",
  callback = function()
    vim.treesitter.language.register("rust", "rust_with_rstml")
    vim.treesitter.start(0, "rust_with_rstml")
  end,
})

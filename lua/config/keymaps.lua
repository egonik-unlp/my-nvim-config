-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tt", function()
  require("snacks.terminal").open(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Open floating terminal" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.keymap.set("i", "<Tab>", "<C-y>,", { buffer = true })
  end,
})

-- Normal mode: \ behaves like "
vim.keymap.set("n", "\\", '"', { noremap = true })

-- Visual mode: \ behaves like "
vim.keymap.set("v", "\\", '"', { noremap = true })

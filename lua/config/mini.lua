require("leap").add_default_mappings()
vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)")

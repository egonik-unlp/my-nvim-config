return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  },
  config = function()
    require("telescope").setup()
  end,
}

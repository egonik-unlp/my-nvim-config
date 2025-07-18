return {
  "nvim-telescope/telescope.nvim",
  version = false, -- latest version
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Switch buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
  config = function()
    require("telescope").setup()
  end,
}

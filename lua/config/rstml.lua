-- lua/config/rstml.lua
vim.treesitter.language.register("rust", "rust_with_rstml")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "rust", "html" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    "rayliwell/tree-sitter-rstml",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = ":TSUpdate",
    config = function()
      require("tree-sitter-rstml").setup({
        enable_default_highlight = true,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "rust_with_rstml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

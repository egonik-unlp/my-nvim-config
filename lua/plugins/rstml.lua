return {
  "rayliwell/tree-sitter-rstml",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("tree-sitter-rstml").setup({
      enable_default_highlight = true,
    })
  end,
}

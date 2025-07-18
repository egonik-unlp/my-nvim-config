-- return {
--   -- add tokyonight
--   {
--     "folke/tokyonight.nvim",
--     lazy = true,
--     opts = {
--       style = "storm",
--     },
--   },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "tokyonight",
--     },
--   },
-- }
--
--
return {
  -- add tokyonight
  {
    "savq/melange-nvim",
    lazy = true,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
    },
  },
}

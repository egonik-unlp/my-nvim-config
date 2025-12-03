return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "gruvbox",
        "catppuccin",
        "tokionight",
        "kanagawa",
        "cyberdream",
        "aura-theme",
        "nordfox",
        "oxocarbon",
        "rose-pine",
      }, -- Your list of installed colorschemes.
      livePreview = true, -- Apply theme while picking. Default to true.
    }) -- add the config here
  end,
}

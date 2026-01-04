return {pkgs={{file="lazy.lua",dir="/home/gonik/.local/share/nvim/lazy/noice.nvim",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,source="lazy",name="noice.nvim",},{file="community",dir="/home/gonik/.local/share/nvim/lazy/plenary.nvim",spec={"nvim-lua/plenary.nvim",lazy=true,},source="lazy",name="plenary.nvim",},{file="telescope.nvim-scm-1.rockspec",dir="/home/gonik/.local/share/nvim/lazy/telescope.nvim",spec={"telescope.nvim",build=false,specs={{"nvim-lua/plenary.nvim",lazy=true,},},},source="rockspec",name="telescope.nvim",},},version=12,}
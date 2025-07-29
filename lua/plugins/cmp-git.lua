return {
  {
    "petertriho/cmp-git",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp_git = { name = "git" }

      -- Asegurar tabla de sources
      opts.sources = opts.sources or {}
      -- Insertar el source de git (al principio o al final según prefieras)
      table.insert(opts.sources, 1, cmp_git)
    end,
  },
}

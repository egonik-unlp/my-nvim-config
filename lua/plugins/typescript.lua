return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local util = require("lspconfig.util")
      opts = opts or {}
      opts.servers = opts.servers or {}

      -- Disable denols unless you explicitly want it (no deno executable -> warning).
      opts.servers.denols = false

      opts.servers.vtsls = vim.tbl_deep_extend("force", {
        root_dir = function(fname)
          return util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
            or util.path.dirname(fname)
        end,
        single_file_support = true,
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = false,
              },
            },
          },
        },
      }, opts.servers.vtsls or {})

      return opts
    end,
  },
}

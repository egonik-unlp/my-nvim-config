return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_ls = {
        -- Avoid attaching to huge roots; only enable when inside a project.
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern("package.json")(fname)
        end,
        single_file_support = false,
        filetypes = {
          "html",
          "css",
          "typescriptreact",
          "javascriptreact",
          "typescript",
          "vue",
        },
        init_options = {
          html = {
            ["bem.enabled"] = true,
          },
        },
      },
    },
  },
}

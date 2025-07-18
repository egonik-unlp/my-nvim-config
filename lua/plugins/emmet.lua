return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_ls = {
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

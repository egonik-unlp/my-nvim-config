-- lua/plugins/tailwind.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes = {
            "html",
            "rust_with_rstml",
          },
          init_options = {
            userLanguages = {
              rust_with_rstml = "html",
            },
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { 'class\\s*=\\s*"([^"]*)"' },
                  { 'class:\\s*"([^"]*)"' },
                  { 'class%s*=%s*"([^"]*)"' },
                  { 'class%s*:%s*"([^"]*)"' },
                  { "class%s*=%s*%(([^)]*)%)" },
                },
              },
              validate = true,
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
              },
            },
          },
          root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", "package.json", ".git"),
        },
      },
    },
  },
}

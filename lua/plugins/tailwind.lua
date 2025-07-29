return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "rust",
            "rsx",
          },
          init_options = {
            userLanguages = {
              rust = "html",
              rsx = "html",
            },
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { 'class\\s*=\\s*"([^"]*)"' },
                  { 'class:\\s*"([^"]*)"' },
                  { 'class%s*=%s*"([^"]*)"' }, -- para class="..."
                  { 'class%s*:%s*"([^"]*)"' }, -- para class: "..."
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
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "postcss.config.js",
            "package.json",
            ".git"
          ),
        },
      },
    },
  },
}

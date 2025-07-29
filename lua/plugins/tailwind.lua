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
          },
          init_options = {
            userLanguages = {
              rust = "html", -- Treat .rs files as if they were HTML
            },
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  {
                    'class:\\s*"(.*)"', -- Notice: double escaping not needed in Lua strings
                  },
                  { 'class\\s*=\\s*"([^"]*)"' }, -- ← esto matchea class="..."
                  { 'class:\\s*"([^"]*)"' },
                },
              },
            },
          },
        },
      },
    },
  },
}

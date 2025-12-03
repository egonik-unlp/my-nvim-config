return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        -- exclude a filetype from the default_config
        filetypes_exclude = { "markdown" },
        -- add additional filetypes to the default_config
        filetypes_include = { "html", "rust", "go", "templ", "javascript", "jsx", "typescript", "tsx" },
        -- Make Tailwind treat Rust buffers like HTML so it scans class attributes
        -- init_options = {
        --   userLanguages = {
        --     rust = "html",
        --   },
        -- },
        includeLanguages = {
          rust = "html",
        },
        -- to fully override the default_config, change the below
        -- filetypes = {}

        -- additional settings for the server, e.g:
        -- tailwindCSS = { includeLanguages = { someLang = "html" } }
        -- can be addeded to the settings table and will be merged with
        -- this defaults for Phoenix projects
        settings = {
          tailwindCSS = {
            -- Keep some language mappings used elsewhere
            files = {
              exclude = {
                "**/.git/**",
                "**/node_modules/**",
                "**/dist/**",
                "**/build/**",
                "**/coverage/**",
                "**/target/**", -- ⬅️ importante para Rust/Leptos
                "**/*.min.js",
                "**/*.log",
              },
            },
            includeLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
              -- For Rust, we handle via init_options.userLanguages above
            },
            -- Enable Tailwind to extract classes from Leptos view! markup
            experimental = {
              -- classRegex = {
              --   -- Leptos view! macro uses HTML-like attributes
              --   -- class="..." and class='...'
              --   "class\\s*=\\s*\"([^\"]*)\"",
              --   "class\\s*=\\s*'([^']*)'",
              --   -- Also match a `class: "..."` style in case it appears
              --   "class:\\s*\"([^\"]*)\"",
              --   "class:\\s*'([^']*)'",
              -- },
            },
          },
        },
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,
    },
  },
}

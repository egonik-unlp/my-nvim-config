return {
  -- LSP base
  {
    "neovim/nvim-lspconfig",
    dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        dockerls = {
          -- dockerfile-language-server formatea y da hover/diagnostics
          settings = {
            docker = {
              languageserver = {
                diagnostics = { allowedRules = {}, ignoredRules = {} },
              },
            },
          },
        },
        docker_compose_language_service = {
          filetypes = { "yaml.docker-compose" },
        },
      },
      setup = {
        -- Nada especial, pero te dejo el hook por si querés extender
        dockerls = function(_, opts)
          require("lspconfig").dockerls.setup(opts)
          return true
        end,
        docker_compose_language_service = function(_, opts)
          require("lspconfig").docker_compose_language_service.setup(opts)
          return true
        end,
      },
    },
  },

  -- Lint (LazyVim usa nvim-lint por defecto)
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        dockerfile = { "hadolint" },
        ["yaml.docker-compose"] = { "yamllint" }, -- opcional
      },
    },
  },

  -- Formato (Conform). Dockerfile lo puede formatear el server (LSP).
  -- Para YAML podés usar prettier o yamlfmt si querés.
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- Dockerfile: usá el formateo LSP (no hace falta conform)
        ["yaml.docker-compose"] = { "prettier" }, -- o "yamlfmt" si lo tenés
      },
    },
  },
}

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Asegurar que sources exista como tabla vacía
      opts.sources = opts.sources or {}

      -- Mapping
      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      -- Lista de fuentes (aplanada correctamente)
      local extra_sources = {
        { name = "nvim_lsp" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local context = require("cmp.config.context")
              if context.in_treesitter_capture("string") or context.in_syntax_group("String") then
                return {}
              end
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        {
          name = "path",
          option = {
            trailing_slash = true,
          },
        },
      }

      -- Fusionar fuentes nuevas con las existentes
      table.insert(opts.sources, { name = "git" })
      opts.sources = vim.list_extend(opts.sources, extra_sources)
    end,
  },
}

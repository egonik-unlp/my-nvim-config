-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     enabled = true,
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "L3MON4D3/LuaSnip",
--     },
--     config = function()
--       local cmp = require("cmp")
--       cmp.setup({
--         mapping = cmp.mapping.preset.insert({
--           ["<Tab>"] = cmp.mapping.select_next_item(),
--           ["<S-Tab>"] = cmp.mapping.select_prev_item(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         }),
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "buffer" },
--           { name = "path" },
--         }),
--       })
--     end,
--   },
--
--
--
--
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
      "onsails/lspkind.nvim", -- 👈 agregá esto
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      opts.sources = cmp.config.sources({
        -- Tailwind via LSP always first
        { name = "nvim_lsp" },
        -- Only suggest buffer/path when you're not in quotes
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local context = require("cmp.config.context")
              -- only enable when not in string (e.g., class="...")
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
      })
    end,
  },
}

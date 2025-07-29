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
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      })
    end,
  },
}

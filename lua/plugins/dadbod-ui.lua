return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
      -- { name = "dev", url = "postgres://user:pass@localhost:5432/dev" },
      { name = "local", url = "postgres://postgres:example@localhost:5488/postgres" },
      { name = "conversations", url = "postgres://postgres:example@localhost:5488/conversations" },
      { name = "dashboard", url = "postgres://postgres:example@localhost:5555/dashboard" },
      -- { name = "stage", url = "postgres://user:pass@localhost:5432/staging" },
    }
  end,
  -- { -- optional saghen/blink.cmp completion source
  --   "saghen/blink.cmp",
  --   opts = {
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" },
  --       per_filetype = {
  --         sql = { "snippets", "dadbod", "buffer" },
  --       },
  --       -- add vim-dadbod-completion to your completion providers
  --       providers = {
  --         dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
  --       },
  --     },
  --   },
  -- },
}

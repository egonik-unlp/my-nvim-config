return { -- optional saghen/blink.cmp completion source
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts = opts or {}
    opts.sources = opts.sources or {}
    opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }
    opts.sources.per_filetype = opts.sources.per_filetype or {}
    opts.sources.per_filetype.sql = { "snippets", "dadbod", "buffer" }
    -- add vim-dadbod-completion to your completion providers
    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers.dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" }
    return opts
  end,
}

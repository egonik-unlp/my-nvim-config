return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local ok, blink = pcall(require, "blink.cmp")
    if not ok then
      return opts
    end
    opts = opts or {}
    opts.servers = opts.servers or {}
    opts.servers["*"] = vim.tbl_deep_extend("force", opts.servers["*"] or {}, {
      capabilities = blink.get_lsp_capabilities(),
    })
    return opts
  end,
}

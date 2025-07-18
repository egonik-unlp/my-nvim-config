return {
  -- This targets the LSP core setup plugin
  "neovim/nvim-lspconfig",
  config = function(_, opts)
    -- Set up normal LSP servers (optional if already configured)
    require("lspconfig").util.default_config = vim.tbl_deep_extend("force", require("lspconfig").util.default_config, {
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
        }),
      },
    })

    -- Auto-hover on CursorHold
    vim.o.updatetime = 300
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.lsp.buf.hover()
      end,
    })
  end,
}

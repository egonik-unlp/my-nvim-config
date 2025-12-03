vim.lsp.config("rust_analyzer", {
  -- Other Configs ...
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
      -- Other Settings ...
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            -- "component",
            "server",
          },
        },
      },
    },
  },
})

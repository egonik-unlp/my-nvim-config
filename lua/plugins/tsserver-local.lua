if not vim.g.use_tsserver then
  return {}
end

local function resolve_tsserverlibrary()
  local uv = vim.uv or vim.loop
  local cwd = uv.cwd() or vim.fn.getcwd()
  local ws = cwd .. "/node_modules/typescript/lib/tsserverlibrary.js"
  if uv.fs_stat(ws) then
    return ws
  end
  local mason_ts = vim.fn.stdpath("data")
    .. "/mason/packages/typescript-language-server/node_modules/typescript/lib/tsserverlibrary.js"
  if uv.fs_stat(mason_ts) then
    return mason_ts
  end
  return "tsserverlibrary.js"
end

local function safe_root_dir(fname_or_buf)
  local util = require("lspconfig.util")
  local fname = fname_or_buf
  if type(fname_or_buf) == "number" then
    fname = vim.api.nvim_buf_get_name(fname_or_buf)
  end
  if not fname or fname == "" then
    fname = (vim.uv or vim.loop).cwd() or vim.fn.getcwd()
  end
  local root = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
    or util.find_git_ancestor(fname)
    or util.path.dirname(fname)
  return root
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts = opts or {}
      opts.servers = opts.servers or {}
      opts.setup = opts.setup or {}

      -- disable vtsls and ts_ls; use tsserver only
      opts.setup.vtsls = function() return true end
      opts.servers.vtsls = false
      opts.setup.ts_ls = function() return true end
      opts.servers.ts_ls = false

      opts.servers.tsserver = vim.tbl_deep_extend("force", {
        single_file_support = true,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        -- Use the buffer path to avoid attaching tsserver to an overly broad CWD.
        root_dir = safe_root_dir,
        init_options = {
          hostInfo = "neovim",
          disableAutomaticTypingAcquisition = true,
          maxTsServerMemory = 4096,
          preferences = {
            includePackageJsonAutoImports = "off",
            includeCompletionsForModuleExports = true,
          },
          tsserver = {
            logVerbosity = "off",
            path = resolve_tsserverlibrary(),
          },
        },
        cmd = {
          vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server",
          "--stdio",
        },
        settings = {},
      }, opts.servers.tsserver or {})

      return opts
    end,
  },
}

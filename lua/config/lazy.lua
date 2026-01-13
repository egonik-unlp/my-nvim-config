local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- vim.treesitter.language.register("rust", "rust_with_rstml")
-- vim.filetype.add({
-- extension = {
-- rs = function(path, bufnr)
-- if vim.fn.search("view!", "nw") ~= 0 then
-- return "rust_with_rstml"
-- end
-- return "rust"
-- end,
-- },
-- })
local function load_lazyvim_extras()
  local path = vim.fn.stdpath("config") .. "/lazyvim.json"
  local ok, data = pcall(function()
    local contents = table.concat(vim.fn.readfile(path), "\n")
    if contents == "" then
      return nil
    end
    return vim.json.decode(contents)
  end)
  if not ok or type(data) ~= "table" or type(data.extras) ~= "table" then
    return {}
  end
  local specs = {}
  for _, extra in ipairs(data.extras) do
    table.insert(specs, { import = extra })
  end
  return specs
end

local extras = load_lazyvim_extras()
local spec = {
  -- add LazyVim and import its plugins
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
}
vim.list_extend(spec, extras)
-- import/override with your plugins
table.insert(spec, { import = "plugins" })

require("lazy").setup({
  spec = spec,
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },

  install = { colorscheme = { "gruvbox", "tokionight" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        --"tutor",
        "zipPlugin",
      },
    },
  },
})

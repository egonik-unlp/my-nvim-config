return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          cmd = {
            "julia",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            [[
              using LanguageServer, SymbolServer, Pkg;
              depot_path = get(ENV, "JULIA_DEPOT_PATH", "");
              project_path = Base.current_project(pwd());
              server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
              server.runlinter = true;
              run(server);
            ]],
          },
          -- Optional: adjust this if you want custom root_dir logic
          root_dir = require("lspconfig.util").root_pattern("Project.toml", ".git"),
        },
      },
    },
  },
}

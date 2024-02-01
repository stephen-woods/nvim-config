return {
  "nvim-treesitter/nvim-treesitter",
--  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "java", "scala", "rust", "markdown" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

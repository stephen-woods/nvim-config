return {
  "nvim-treesitter/nvim-treesitter",
--  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "bash", "c", "go", "html", "java", "javascript", "lua", "markdown", "query", "rust", "scala", "vim", "vimdoc" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}


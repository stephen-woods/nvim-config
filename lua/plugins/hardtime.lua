return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    enabled = true,
    opts = {

      -- Max count defaults to just 2. Making it a little more lenient
      -- makes sense, especially if you need to traverse within a long 
      -- word
      max_count = 10,
      -- Disable hardtime in additional filetypes
      disabled_filetypes = {
        "lspinfo",
      }
    },
  }
}

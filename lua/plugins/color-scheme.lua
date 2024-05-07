return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    flavour = "mocha",
    priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = false,
        dap = {
          enabled = false,
          enable_ui = false,
        }
      }
    },
    init = function()
      vim.cmd [[colorscheme catppuccin]]
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function ()
     require("nvim-highlight-colors").setup({})
    end
  }
}

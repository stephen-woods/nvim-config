return {
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
      },
      highlight_overrides = {
        all = function(color)
          return {
            LineNr = { fg = color.flamingo },
          }
        end,
      }
    },
    init = function()
      vim.o.termguicolors = true
      vim.cmd [[colorscheme catppuccin]]
    end
  },
}

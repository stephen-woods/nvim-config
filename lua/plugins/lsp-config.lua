return {
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    },
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "folke/neodev.nvim" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              properties = {
                globals = { "vim" }
              }
            }
          }
        }
      })
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
  },
  {
    "scalameta/nvim-metals",
    ft = {"scala", "sbt", "java"},
    dependencies = "nvim-lua/plenary.nvim",
    opts = function()
      local metals_config = require("metals").bare_config()

      -- Example of settings
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
      }

      -- *READ THIS*
      -- I *highly* recommend setting statusBarProvider to true, however if you do,
      -- you *have* to have a setting to display this in your statusline or else
      -- you'll not see any messages from metals. There is more info in the help
      -- docs about this
      -- metals_config.init_options.statusBarProvider = "on"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()

        -- LSP mappings
        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.definition, { desc = "LSP jump to symbol definition" })
        map("n", "K", vim.lsp.buf.hover, { desc = "LSP display symbol information" })
        map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP list all implementations" })
        map("n", "gr", vim.lsp.buf.references, { desc = "LSP list all references" })
        map("n", "gds", vim.lsp.buf.document_symbol, { desc = "LSP display all symbols in buffer" })
        map("n", "gws", vim.lsp.buf.workspace_symbol, { desc = "LSP display all symbols in workspace" })
        map("n", "<leader>cl", vim.lsp.codelens.run, { desc = "LSP run code lens in current line" })
        map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP display signature help" })
        map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename all references to symbol" })
        map("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP format buffer" })
        map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

        map("n", "<leader>ws", function()
          require("metals").hover_worksheet()
        end)

        -- all workspace diagnostics
        map("n", "<leader>aa", vim.diagnostic.setqflist)

        -- all workspace errors
        map("n", "<leader>ae", function()
          vim.diagnostic.setqflist({ severity = "E" })
        end)

        -- all workspace warnings
        map("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = "W" })
        end)

        -- buffer diagnostics only
        map("n", "<leader>d", vim.diagnostic.setloclist)

        map("n", "[c", function()
          vim.diagnostic.goto_prev({ wrap = false })
        end)

        map("n", "]c", function()
          vim.diagnostic.goto_next({ wrap = false })
        end)

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        map("n", "<leader>dc", function()
          require("dap").continue()
        end)

        map("n", "<leader>dr", function()
          require("dap").repl.toggle()
        end)

        map("n", "<leader>dK", function()
          require("dap.ui.widgets").hover()
        end)

        map("n", "<leader>dt", function()
          require("dap").toggle_breakpoint()
        end)

        map("n", "<leader>dso", function()
          require("dap").step_over()
        end)

        map("n", "<leader>dsi", function()
          require("dap").step_into()
        end)

        map("n", "<leader>dl", function()
          require("dap").run_last()
        end)

        map("n", "<leader>mc", function()
          require("telescope").extensions.metals.commands()
        end)
      end
      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  }
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local map = vim.keymap.set
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()


      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end


      map("n", "<leader>dc", function()
        dap.continue()
      end)

      map("n", "<leader>dr", function()
        dap.repl.toggle()
      end)

      map("n", "<leader>dK", function()
        require("dap.ui.widgets").hover()
      end)

      map("n", "<leader>dt", function()
        dap.toggle_breakpoint()
      end)

      map("n", "<leader>dso", function()
        dap.step_over()
      end)

      map("n", "<leader>dsi", function()
        dap.step_into()
      end)

      map("n", "<leader>dl", function()
        dap.run_last()
      end)

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end
  },
}

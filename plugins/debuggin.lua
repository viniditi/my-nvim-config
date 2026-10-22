return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- ========================================
    -- DAP UI
    -- ========================================

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- ========================================
    -- Python
    -- ========================================

    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath("data")
        .. "/mason/packages/debugpy/venv/bin/python",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch current file",
        program = "${file}",

        pythonPath = function()
          return vim.fn.exepath("python3")
        end,
      },
    }

    -- ========================================
    -- Node.js
    -- ========================================

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = 9229,

      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data")
            .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "9229",
        },
      },
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    dap.configurations.typescript = dap.configurations.javascript

    -- ========================================
    -- Keymaps
    -- ========================================

    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<Leader>c", dap.continue)
    vim.keymap.set("n", "<Leader>n", dap.step_over)
    vim.keymap.set("n", "<Leader>i", dap.step_into)
    vim.keymap.set("n", "<Leader>o", dap.step_out)
    vim.keymap.set("n", "<Leader>r", dap.restart)
    vim.keymap.set("n", "<Leader>x", dap.terminate)
  end,
}


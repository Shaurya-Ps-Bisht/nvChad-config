-- Debugging: nvim-dap + dap-ui + Mason adapter bridge.
-- Keymaps (<leader>db, <leader>dr) live in lua/mappings.lua.

-- NVIDIA PRIME render offload: runs the debuggee on the dGPU.
-- TODO: move this into a separate "debug with GPU" launch config; right now even the default one gets it.
-- TODO: fix the VRAM allocation cap on not-titanfall3.
local dgpu_env = {
  __NV_PRIME_RENDER_OFFLOAD = "1",
  __GLX_VENDOR_LIBRARY_NAME = "nvidia",
  __VK_LAYER_NV_optimus = "NVIDIA_only",
}

return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      -- nvim-nio is dap-ui's dependency, so it no longer needs its own spec.
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      { "jay-babu/mason-nvim-dap.nvim", dependencies = { "mason-org/mason.nvim" } },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      -- Set before mason-nvim-dap so its auto-registered configurations are appended after this one.
      dap.configurations.cpp = {
        {
          name = "Build Directory Debug",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
          cwd = "${workspaceFolder}/bin/Debug",
          stopOnEntry = false,
          env = dgpu_env,
          args = {},
          sourceLanguages = { "cpp" },
        },
      }

      -- Registers adapters (e.g. codelldb) for every debugger installed through Mason.
      require("mason-nvim-dap").setup { handlers = {} }

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
    end,
  },
}

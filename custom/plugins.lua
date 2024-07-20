local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "VeryLazy",
    config = function()
      require('nvim-lightbulb').setup({
        priority = 10,
        hide_in_unfocused_buffer = true,
        link_highlights = true,
    validate_config = "auto",

    action_kinds = nil,

    sign = {
        enabled = false,
        text = "💡",
        hl = "LightBulbSign",
    },

    virtual_text = {
        enabled = false,
        text = "💡",
        pos = "eol",
        hl = "LightBulbVirtualText",
        hl_mode = "combine",
    },

    float = {
        enabled = true,
        text = "💡",
        hl = "LightBulbFloatWin",
        win_opts = {
            focusable = false,
        },
    },

    status_text = {
        enabled = false,
        text = "💡",
        text_unavailable = "",
    },

    number = {
        enabled = false,
        hl = "LightBulbNumber",
    },

    line = {
        enabled = false,
        hl = "LightBulbLine",
    },

    autocmd = {
        enabled = false,
        updatetime = 200,
        events = { "CursorHold", "CursorHoldI" },
        pattern = { "*" },
    },

    ignore = {
        clients = {},
        ft = {},
        actions_without_kind = false,
    },

      })
      vim.cmd [[
        augroup Lightbulb
          autocmd!
          autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
        augroup END
      ]]
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {"mfussenegger/nvim-dap","nvim-neotest/nvim-nio"},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
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
    end
  },
  { "nvim-neotest/nvim-nio" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      local dap = require('dap')
      require("core.utils").load_mappings("dap")
      dap.configurations.cpp = {
      {
        name = "Build Directory Debug",
        type = "codelldb",
        request = "launch",
        program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
        cwd = '${workspaceFolder}/bin/Debug',
        stopOnEntry = false,
        args = {},
        sourceLanguages = { "cpp" },
      }
    }

    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "tikhomirov/vim-glsl",
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        -- "lua-language-server",
        -- "clang-format",
        "codelldb",
      }
    }
  }
}
return plugins

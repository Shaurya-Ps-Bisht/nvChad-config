-- LSP-adjacent tooling. Server setup itself lives in lua/configs/lspconfig.lua.
return {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "kosayoda/nvim-lightbulb",
    event = "VeryLazy",
    -- Only the options that differ from the plugin defaults.
    opts = {
      sign = { enabled = false },
      float = { enabled = true },
      -- The plugin now owns the CursorHold/CursorHoldI autocmd (was a hand-written vimscript augroup).
      -- updatetime = -1 leaves 'updatetime' alone (NvChad sets it).
      autocmd = { enabled = true, updatetime = -1 },
    },
  },
}

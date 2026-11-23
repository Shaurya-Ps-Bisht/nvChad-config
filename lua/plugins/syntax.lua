return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- A table (not a function) so NvChad's `:TSInstallAll` can read it; lazy.nvim still runs NvChad's own
    -- opts function first, so its base46 highlight cache is loaded. Lists are replaced when merged, so
    -- NvChad's defaults (lua, luadoc, printf, vim, vimdoc) are repeated here.
    opts = {
      ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "javascript", "typescript", "tsx", "cpp" },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {},
  },

  -- Moved from tikhomirov/vim-glsl.
  {
    "stykhomyrov/vim-glsl",
    event = "VeryLazy",
  },
}

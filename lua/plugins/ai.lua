-- Claude Code IDE integration: Claude sees your current file / selection / diagnostics and proposes
-- edits as native Neovim diffs (accept with :w or :ClaudeCodeDiffAccept, reject with :q or :ClaudeCodeDiffDeny).
-- Keymaps live in lua/mappings.lua.
return {
  {
    "coder/claudecode.nvim",
    -- snacks.nvim provides the terminal that Claude runs in. Nothing else from snacks is enabled.
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    -- Command stubs: lazy.nvim loads the plugin the first time one of these (or a mapped key) is used.
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
      "ClaudeCodeSendText",
      "ClaudeCodeTreeAdd",
      "ClaudeCodeStatus",
      "ClaudeCodeStart",
      "ClaudeCodeStop",
      "ClaudeCodeOpen",
      "ClaudeCodeClose",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
      "ClaudeCodeCloseAllDiffs",
    },
  },
}

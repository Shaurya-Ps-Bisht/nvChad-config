require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- nvim-dap (was `M.dap` in custom/mappings.lua)
-- Calling require("dap") lazy-loads the plugin on first use, so these work before it has loaded.
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Add breakpoint at line" })

map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Start or continue the debugger" })

-- Claude Code (claudecode.nvim). The plugin lazy-loads through the `cmd` stubs in lua/plugins/ai.lua.
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Claude toggle" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Claude focus" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Claude resume" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Claude continue" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Claude select model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Claude add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Claude send selection" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Claude accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Claude deny diff" })

-- In nvim-tree, <leader>as adds the file under the cursor to Claude's context.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(ev)
    map("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = ev.buf, desc = "Claude add file" })
  end,
})

-- Terminal windows (Claude panel and NvChad's Alt-h/v/i terminals). In terminal mode every key goes to the
-- program, so the normal-mode window keys (<C-h> etc.) do nothing there. These leave terminal mode and jump to
-- the split on that side in one key.
-- Only left/up are mapped on purpose: Claude's prompt and shells use <C-j> (newline) and <C-l> (redraw/clear),
-- and each key mapped here stops reaching the program. <C-k> (delete to end of line) is given up; add "j" / "l"
-- to the list if your layout needs them.
for _, key in ipairs { "h", "k" } do
  map("t", "<C-" .. key .. ">", "<C-\\><C-n><C-w>" .. key, { desc = "terminal move to window " .. key })
end

-- Markdown (render-markdown.nvim): toggle the rendered view in the current markdown buffer.
-- The :RenderMarkdown command stub in lua/plugins/markdown.lua loads the plugin on first use.
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown render toggle" })

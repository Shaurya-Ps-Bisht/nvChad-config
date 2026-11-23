require "nvchad.autocmds"

-- Reload buffers when their file changes on disk, e.g. when Claude Code edits files from its terminal pane.
-- 'autoread' is already on by default, but Neovim only re-checks on a few events, and CursorHold fires once per
-- keypress (so it never fires while you sit and watch). Check on focus/buffer switch and also poll once a second.
vim.o.autoread = true

local function checktime()
  if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
    vim.cmd "silent! checktime"
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("ReloadOnDiskChange", { clear = true }),
  callback = checktime,
})
vim.uv.new_timer():start(1000, 1000, vim.schedule_wrap(checktime))

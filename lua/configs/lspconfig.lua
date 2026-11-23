-- Sets up NvChad's defaults: "*" capabilities/on_init, the LspAttach keymaps, and lua_ls.
require("nvchad.configs.lspconfig").defaults()

-- Servers that need no custom options.
local servers = { "html", "cssls", "tailwindcss", "eslint" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.lsp.config("clangd", {
  -- Match none-ls's utf-16 offset encoding to avoid the "multiple different client offset_encodings" warning.
  cmd = { "clangd", "--offset-encoding=utf-16" },
  -- cmd = { "clangd", "--function-arg-placeholders=0" },
  on_attach = function(client, _)
    client.server_capabilities.signatureHelpProvider = false
  end,
})
vim.lsp.enable "clangd"

-- `tsserver` was renamed to `ts_ls` in nvim-lspconfig.
vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
})
vim.lsp.enable "ts_ls"

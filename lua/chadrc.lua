-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
	-- transparency = true,

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- Extra Mason packages for `:MasonInstallAll` (see :h nvui.mason).
-- NvChad already auto-detects tools for every server passed to vim.lsp.enable() and every
-- conform.nvim formatter, so this list only needs what can't be detected: the none-ls
-- formatter binaries and the DAP adapter. (Replaces the old `ensure_installed` in mason opts,
-- which Mason v2 / NvChad v2.5 ignore.)
M.mason = {
	pkgs = {
		"clangd",
		-- "clang-format",
		"codelldb",
		"typescript-language-server",
		"tailwindcss-language-server",
		"prettierd",
		"eslint-lsp",
		"tree-sitter-cli", -- nvim-treesitter needs it to build parsers (:TSInstallAll)
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M

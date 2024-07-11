---@type ChadrcConfig
local M = {}

M.ui = { theme = 'yoru',
        transparency = true,}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M

local M = {}

M.load_highlight = function(group)
  -- if type(group) == "string" and group == "core" then
  --     local syntax = require("colors.integrations.syntax")
  --     local nvim = require("colors.integrations.nvim")
  --     group = merge_tb("force", syntax, nvim)
  -- end
  if type(group) == "string" then
    group = require("colors.integrations." .. group)
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.core_setup = function ()
    -- vim.cmd('hi clear')
    require("colors.term_hl")
    require("colors").load_highlight "syntax"
    require("colors").load_highlight "nvim"
end

return M

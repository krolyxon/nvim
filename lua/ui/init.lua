local M = {}

M.load_highlight = function(group)
  -- if type(group) == "string" and group == "core" then
  --     local syntax = require("ui.integrations.syntax")
  --     local nvim = require("ui.integrations.nvim")
  --     group = merge_tb("force", syntax, nvim)
  -- end
  if type(group) == "string" then
    group = require("ui.integrations." .. group)
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.setup_colorscheme = function ()
    -- vim.cmd('hi clear')
    require("ui.term_hl")
    require("ui").load_highlight "syntax"
    require("ui").load_highlight "nvim"
end

return M

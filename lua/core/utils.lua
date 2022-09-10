local M = {}
local merge_tb = vim.tbl_deep_extend


M.load_highlight = function(group)
  if type(group) == "string" and group == "core" then
      local syntax = require("colors.integrations.syntax")
      local nvim = require("colors.integrations.nvim")
      group = merge_tb("force", syntax, nvim)
  end
  if type(group) == "string" then
    group = require("colors.integrations." .. group)
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.close_buffer = function(bufnr)
    if vim.bo.buftype == "terminal" then
        vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
    else
        bufnr = bufnr or vim.api.nvim_get_current_buf()
        vim.cmd("confirm bd" .. bufnr)
    end
end

M.load_mappings = function(section, mapping_opt)
    local function set_section_map(section_values)
        if section_values.plugin then
            return
        end
        section_values.plugin = nil

        for mode, mode_values in pairs(section_values) do
            local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
            for keybind, mapping_info in pairs(mode_values) do
                -- merge default + user opts
                local opts = merge_tb("force", default_opts, mapping_info.opts or {})

                mapping_info.opts, opts.mode = nil, nil
                opts.desc = mapping_info[2]

                vim.keymap.set(mode, keybind, mapping_info[1], opts)
            end
        end
    end

    local mappings = require("core.mappings")

    if type(section) == "string" then
        mappings[section]["plugin"] = nil
        mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
        set_section_map(sect)
    end
end

return M

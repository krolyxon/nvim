local M = {}

M.load_config = function()
   local conf = require "core.default_config"
   return conf
end

M.map = function(mode, keys, command, opt)
   local options = { silent = true }

   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   if type(keys) == "table" then
      for _, keymap in ipairs(keys) do
         M.map(mode, keymap, command, opt)
      end
      return
   end

   vim.keymap.set(mode, keys, command, opt)
end

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

-- merge default/user plugin tables
M.plugin_list = function(default_plugins)
   local user_plugins = require("core.utils").load_config().plugins.user

   -- require if string is present
   local ok

   if type(user_plugins) == "string" then
      ok, user_plugins = pcall(require, user_plugins)
      if ok and not type(user_plugins) == "table" then
         user_plugins = {}
      end
   end

   -- merge default + user plugin table
   default_plugins = vim.tbl_deep_extend("force", default_plugins, user_plugins)

   local final_table = {}

   for key, _ in pairs(default_plugins) do
      default_plugins[key][1] = key

      final_table[#final_table + 1] = default_plugins[key]
   end

   return final_table
end

M.load_override = function(default_table, plugin_name)
   local user_table = require("core.utils").load_config().plugins.override[plugin_name]
   if type(user_table) == "table" then
      default_table = vim.tbl_deep_extend("force", default_table, user_table)
   else
      default_table = default_table
   end
   return default_table
end

return M

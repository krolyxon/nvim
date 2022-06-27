local M = {}

M.options = {

   -- load your options here or load module with options1
   user = function() end,
}

---- UI -----

M.ui = {
   changed_themes = {},
   colors = {}, -- dynamically generated, never edit this in chadrc
   theme = "dark_custom", -- default theme
   -- transparency = false,
   transparency = true,
}

M.plugins = {
   override = {},
   remove = {},

   options = {
      packer = {
         init_file = "plugins.packerInit",
         snapshot = nil,
      },
      lspconfig = {
         setup_lspconf = "", -- path of lspconfig file
      },
      statusline = {
         separator_style = "default", -- default/round/slant/block/arrow
      },
   },

   -- add, modify, remove plugins
   user = {},
}

-- non plugin only
M.mappings = {
   misc = function() end,
}

return M

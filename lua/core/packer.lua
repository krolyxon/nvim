local M = {}

M.run = function(plugins)
  local present, packer = pcall(require, "packer")

  if not present then
    return
  end


  local final_table = {}
  for key, _ in pairs(plugins) do 
      plugins[key][1] = key
      final_table[#final_table + 1] = plugins[key]
  end

  
  packer.init({
      auto_clean = true,
      compile_on_sync = true,
      git = { clone_timeout = 6000 },
      display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
          return require("packer.util").float { border = "single" }
        end,
       }
   })

  packer.startup(function(use)
    for _, v in pairs(final_table) do
      use(v)
    end
  end)
end

return M

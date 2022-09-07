local present, rust = pcall(require, "rust-tools")
if not present then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)


local options = {
  tools = {
    inlay_hints = {
      auto = true,
      only_current_line = false,
      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,
    },
    on_initialized = function()
      -- ih.set_all()
    end,
  },
  server = {
    on_attach = function(client, bufnr)
    end,
  },
}

rust.setup(options)

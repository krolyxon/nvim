-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "cssls", "jdtls", "slint_lsp", "pyright", "marksman", "eslint", "emmet_ls", "tailwindcss" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- Html lsp
lspconfig.html.setup {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    init_option = { provideFormatter = true },
    filetypes = { "htmldjango", "html", "javascriptreact", "typescriptreact" },
}

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

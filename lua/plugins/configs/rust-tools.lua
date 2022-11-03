local present, rust = pcall(require, "rust-tools")
if not present then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


local options = {
    tools = {
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
        },
        hover_actions = {
            auto_focus = true,
        },
        on_initialized = function()
            -- ih.set_all()
        end,
    },
    server = {
        on_attach = require("plugins.configs.lspconfig").on_attach,
        standalone = true,
    },

    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                -- command = "check",
                command = "clippy",
            }
        }
    }
}

rust.setup(options)

local present, rust = pcall(require, "rust-tools")
if not present then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


local options = {
    tools = {
        executor = require("rust-tools/executors").termopen,
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
        },
        hover_actions = {
            auto_focus = true,
            border = "rounded",
        },
        on_initialized = function()
            -- ih.set_all()
            vim.api.nvim_create_autocmd({
                "BufEnter",
                "BufReadPre",
                "BufReadPost",
                "BufWritePost",
                "CursorHold",
                "InsertLeave",
                "InsertEnter",
                "BufAdd",
            }, {
                pattern = { "*.rs" },
                callback = function()
                    local _, _ = pcall(vim.lsp.codelens.refresh)
                end,
            })
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
                lens = {
                    enable = true,
                },

                command = "clippy",
            }
        }
    }
}

rust.setup(options)

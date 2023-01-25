local lspconfig = require("lspconfig")

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
    -- if vim.g.vim_version > 7 then
    --   -- nightly
    --   client.server_capabilities.documentFormattingProvider = false
    --   client.server_capabilities.documentRangeFormattingProvider = false
    -- else
    --   -- stable
    --   client.resolved_capabilities.document_formatting = false
    --   client.resolved_capabilities.document_range_formatting = false
    -- end

    utils.load_mappings("lspconfig", { buffer = bufnr })

    if client.server_capabilities.signatureHelpProvider then
        local function lspSymbol(name, icon)
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
        end

        lspSymbol("Error", "")
        lspSymbol("Info", "")
        lspSymbol("Hint", "")
        lspSymbol("Warn", "")

        vim.diagnostic.config {
            virtual_text = {
                prefix = "",
            },
            signs = true,
            underline = true,
            update_in_insert = false,
        }

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
            focusable = false,
            relative = "cursor",
        })

        -- suppress error messages from lang servers
        vim.notify = function(msg, log_level)
            if msg:match "exit code" then
                return
            end
            if log_level == vim.log.levels.ERROR then
                vim.api.nvim_err_writeln(msg)
            else
                vim.api.nvim_echo({ { msg } }, true, {})
            end
        end

        -- Borders for LspInfo winodw
        local win = require "lspconfig.ui.windows"
        local _default_opts = win.default_opts

        win.default_opts = function(options)
            local opts = _default_opts(options)
            opts.border = "single"
            return opts
        end
    end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

-- lspconfig.rust_analyzer.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--
--     settings = {
--       tools = {
--         inlay_hints = {
--           auto = true,
--           show_parameter_hints = true,
--         },
--     },
--     }
-- }

local servers = {
    "marksman",
    "taplo",
    "pylsp",
    "clangd",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    }
end

return M

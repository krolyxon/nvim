local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local M = {}

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
   local opts = _default_opts(options)
   opts.border = "double"
   return opts
end

require("plugins.configs.others").lsp_handlers()

function M.on_attach(client, _)
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

lspconfig.rust_analyzer.setup {
  on_attach = M.on_attach,
  capabilities = capabilities,

        updates = { channel = 'stable' },
        assist = {
            importGroup = true,
            importMergeBehaviour = 'full',
            importPrefix = 'by_crate',
        },
        callInfo = {
            full = true,
        },
        cargo = {
            allFeatures = true,
            autoreload = true,
            loadOutDirsFromCheck = true,
        },
        checkOnSave = {
            command = 'clippy',
            allFeatures = true,
            extraArgs = '--tests',
        },
        completion = {
            addCallArgumentSnippets = true,
            addCallParenthesis = true,
            postfix = {
                enable = true,
            },
            autoimport = {
                enable = true,
            },
        },
        diagnostics = {
            enable = true,
            enableExperimental = true,
        },
        hoverActions = {
            enable = true,
            debug = true,
            gotoTypeDef = true,
            implementations = true,
            run = true,
            linksInHover = true,
        },
        inlayHints = {
            chainingHints = true,
            parameterHints = true,
            typeHints = true,
        },
        lens = {
            enable = true,
            debug = true,
            implementations = true,
            run = true,
            methodReferences = true,
            references = true,
        },
        notifications = {
            cargoTomlNotFound = true,
        },
        procMacro = {
            enable = true,
        },
}


lspconfig.sumneko_lua.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,

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

-- requires a file containing user's lspconfigs
local addlsp_confs = require("core.utils").load_config().plugins.options.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
   require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
end

return M

local clangd = require("clangd_extensions");

local options = {
    server = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        single_file_support = true,
        on_attach = require("plugins.configs.lspconfig").on_attach,
        capabilities = require("plugins.configs.lspconfig").capabilities,
        root_dir = vim.loop.cwd,
        -- The command that starts the language server (Has nothing to do with compiling)
        cmd = {
            "clangd",
            -- NOTE: don't remove this if you don't want errors
            "--offset-encoding=utf-16",
            "-j=4",
            "--background-index",
            "--clang-tidy",
            "--fallback-style=llvm",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
            "--header-insertion-decorators",
            "--pch-storage=memory",
        },
        -- init_option = { fallbackFlags = {  "-std=c++2a"  } }
    }

}
clangd.setup(options)

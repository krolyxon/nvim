return {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        },
    },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                float_win_config = {
                    border = "rounded",
                },
            },
        }
    end,


    -- Crates version completion for rust
    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup()
            -- Add crates.nvim to the cmp sources as soon as we load the plugin
            require("cmp").setup.buffer { sources = { { name = "crates" } } }
        end,
    },
}

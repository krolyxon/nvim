return {
    {
        "stevearc/conform.nvim",
        -- event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },

    -- Misc
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
    },

    {
        "alec-gibson/nvim-tetris",
        cmd = { "Tetris" },
    },

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

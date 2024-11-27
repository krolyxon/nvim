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

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "rust",
                "python",
                "c",
                "regex",
                "html",
                "css",
                "javascript",
                "markdown",
                "markdown_inline",
                "tsx",
            },
        },
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },

    -- Misc
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

    {
        "ThePrimeagen/harpoon",
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
        opts = {},
    },

    -- Task runner for compiler.nvim
    {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
}

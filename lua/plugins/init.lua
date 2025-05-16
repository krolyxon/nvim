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

    {
        "ThePrimeagen/harpoon",
    },

    {
        "vimwiki/vimwiki",
        event = "BufEnter *.md",
        ft = "markdown",
        keys = { "<leader>ww", "<leader>wt" },
        init = function()
            vim.g.vimwiki_list = {
                {
                    -- Here will be the path for your wiki
                    path = "~/dox/brain/",
                    -- The syntax for the wiki
                    syntax = "markdown",
                    ext = "md",
                },
            }
            vim.g.vimwiki_ext2syntax = {
                [".md"] = "markdown", -- Correct initialization of the dictionary
            }
            vim.g.vimwiki_global_ext = 0
        end,
    },


    {
        'kiddos/gemini.nvim',
        -- lazy = false,
        cmd = { "GeminiChat", "GeminiCodeReview", "GeminiUnitTest", "GeminiCodeExplain", "GeminiFunctionHint"},
        config = function()
            require('gemini').setup()
        end
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

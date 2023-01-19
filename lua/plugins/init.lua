-- All plugins have lazy = true by default, to load a plugin on startup just lazy=false
local plugins = {
    ['nvim-lua/plenary.nvim'] = {},

    ["nvim-treesitter/nvim-treesitter"] = {
        init = function()
            require("core.utils").lazy_load "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    ["lewis6991/gitsigns.nvim"] = {
        ft = "gitcommit",
        init = function()
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                callback = function()
                    vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
                    if vim.v.shell_error == 0 then
                        vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                        vim.schedule(function()
                            require("lazy").load { plugins = "gitsigns.nvim" }
                        end)
                    end
                end,
            })
        end,
        config = function()
            require("plugins.configs.others").gitsigns()
        end,
    },

    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
        init = function()
            require("core.utils").load_mappings "telescope"
        end,
    },

    -- lsp stuff

    ["williamboman/mason.nvim"] = {
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require "plugins.configs.mason"
        end,
    },

    ["neovim/nvim-lspconfig"] = {
        init = function()
            require("core.utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    ["simrat39/rust-tools.nvim"] = {
        -- after = "nvim-lspconfig",
        event = "BufEnter *.rs",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.rust-tools")
            require("core.utils").load_mappings "rust"
        end,
    },

    ["Saecki/crates.nvim"] = {
        event = { "BufRead Cargo.toml" },
        config = function()
            require("plugins.configs.others").crates()
        end
    },

    -- load luasnips + cmp related in insert mode only

    ["hrsh7th/nvim-cmp"] = {
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                config = function()
                    require("plugins.configs.others").luasnip()
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("plugins.configs.others").autopairs()
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },

        config = function()
            require "plugins.configs.cmp"
        end,
    },
    -- misc

    ['vimwiki/vimwiki'] = {
        event = "VeryLazy",
        init = function ()
            vim.g.vimwiki_list = {
                {
                    path = '~/dox/notes',
                    syntax = 'markdown',
                    ext = '.md',
                }
            }
        end,
    },

    ["numToStr/Comment.nvim"] = {
        -- keys = { "gc", "gb" },
        config = function()
            require("plugins.configs.others").comment()
        end,
        init = function()
            require("core.utils").load_mappings "comment"
        end,
    },

    ["krolyxon/kterm"] = {
        config = function()
            require "plugins.configs.kterm"
        end,
        init = function()
            require("core.utils").load_mappings "kterm"
        end,
    },

    -- UI stuff

    ["lukas-reineke/indent-blankline.nvim"] = {
        event = "BufRead",
        config = function()
            require("plugins.configs.others").blankline()
        end,
        init = function()
            require("core.utils").lazy_load "indent-blankline.nvim"
            require("core.utils").load_mappings "blankline"
        end,
    },

    ["nvchad/nvim-colorizer.lua"] = {
        opt = true,
        init = function()
            require("core.utils").lazy_load "nvim-colorizer.lua"
        end,
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    },

    ["nvim-lualine/lualine.nvim"] = {
        lazy = false,
        config = function()
            require("plugins.configs.statusline")
        end,
    },

    -- Only load whichkey after all the gui
    ["folke/which-key.nvim"] = {
        enabled = true,
        keys = { "<leader>", "\"", "'", "`" },
        config = function()
            require "plugins.configs.whichkey"
        end,
        init = function()
            require("core.utils").load_mappings "whichkey"
        end,
    },

    ["rose-pine/neovim"] = {},
}

plugins = require("core.utils").format_plugins(plugins)

-- pin commits for all default plugins
for _, value in pairs(plugins) do
    value.pin = true
end

-- load lazy.nvim options
local lazy_config = require "plugins.configs.lazy_nvim"
require("lazy").setup(plugins, lazy_config)

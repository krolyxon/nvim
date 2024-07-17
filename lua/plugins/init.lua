-- All plugins have lazy = true by default, to load a plugin on startup just lazy=false
local plugins = {
    -- { dir = "~/repos/krose-pine",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         function ColorMyPencils(color)
    --             color = color or "rose-pine"
    --             vim.cmd.colorscheme(color)
    --
    --             vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --
    --         end
    --
    --         ColorMyPencils()
    --     end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        init = function()
            require("tokyonight").setup({
                -- transparent = true,
                style = "night"
            })
            vim.cmd.colorscheme("tokyonight-night")
        end
    },

    { 'nvim-lua/plenary.nvim' },

    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("core.utils").lazy_load "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        ft = "gitcommit",
        init = function()
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                callback = function()
                    vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" },
                        {
                            on_exit = function(_, return_code)
                                if return_code == 0 then
                                    vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                                    vim.schedule(function()
                                        require("lazy").load { plugins = { "gitsigns.nvim" } }
                                    end)
                                end
                            end
                        }
                    )
                end,
            })
        end,
        config = function()
            require("plugins.configs.others").gitsigns()
        end,
    },


    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },

    {
        "tpope/vim-fugitive",
        cmd = "Git",
        init = function()
            require("core.utils").load_mappings "fugitive"
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
        init = function()
            require("core.utils").load_mappings "telescope"
        end,
    },

    {
        "ThePrimeagen/harpoon",
        init = function()
            require("core.utils").load_mappings "harpoon"
        end
    },

    -- lsp stuff

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require "plugins.configs.mason"
            local ensure_installed = { "lua-language-server", "rust-analyzer", "pyright", "clangd", "html-lsp" } -- not an option from mason.nvim
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
            end, {})
        end,
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            require("core.utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    {
        "simrat39/rust-tools.nvim",
        -- after = "nvim-lspconfig",
        -- event = "BufEnter *.rs",
        ft = { "rust" },
        event = { "InsertEnter", "BufReadPre", "BufAdd", "BufNew" },
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.rust-tools")
            require("core.utils").load_mappings "rust"
        end,
    },

    {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup()
            -- Add crates.nvim to the cmp sources as soon as we load the plugin
            require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
    },


    {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.clangd")
        end
    },


    {
        "mfussenegger/nvim-jdtls",
        ft = "java",

        config = function()
            local config = {
                cmd = { vim.fn.stdpath "data" .. "/mason/bin/jdtls" },
                root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
            }
            require('jdtls').start_or_attach(config)
        end,
    },
    -- load luasnips + cmp related in insert mode only

    {
        "hrsh7th/nvim-cmp",
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
    --
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter'
    },

    -- {
    --     'vimwiki/vimwiki',
    --     event = "VeryLazy",
    --     init = function()
    --         vim.g.vimwiki_list = {
    --             {
    --                 path = '~/dox/brain/Notes',
    --                 syntax = 'markdown',
    --                 ext = '.md',
    --             }
    --         }
    --     end,
    -- },

    {
        'MeanderingProgrammer/markdown.nvim',
        ft = { "markdown" },
        config = function()
            require('render-markdown').setup({})
        end,
    },

    {
        "numToStr/Comment.nvim",
        -- keys = { "gc", "gb" },
        config = function()
            require("Comment").setup()
        end,
        init = function()
            require("core.utils").load_mappings "comment"
        end,
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        init = function()
            require("core.utils").load_mappings "undotree"
        end,
    },

    {
        "krolyxon/kterm",
        config = function()
            require "plugins.configs.kterm"
        end,
        init = function()
            require("core.utils").load_mappings "kterm"
        end,
    },

    -- UI stuff

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.configs.others").blankline()
        end,
        init = function()
            require("core.utils").lazy_load "indent-blankline.nvim"
            require("core.utils").load_mappings "blankline"
        end,
    },

    {
        "nvchad/nvim-colorizer.lua",
        init = function()
            require("core.utils").lazy_load "nvim-colorizer.lua"
        end,
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.statusline")
        end,
    },

    -- Only load whichkey after all the gui
    {
        "folke/which-key.nvim",
        enabled = true,
        keys = { "<leader>", "\"", "'", "`", "c", "v" },
        cmd = "WhichKey",
        config = function()
            require "plugins.configs.whichkey"
        end,
        init = function()
            require("core.utils").load_mappings "whichkey"
        end,
    },


    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        init = function()
            require("core.utils").load_mappings "nvimtree"
        end,
        opts = function()
            return require "plugins.configs.nvimtree"
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
    },
}

-- pin commits for all default plugins
for _, value in pairs(plugins) do
    value.pin = true
end

-- load lazy.nvim options
local lazy_config = require "plugins.configs.lazy_nvim"
require("lazy").setup(plugins, lazy_config)

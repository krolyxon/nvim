vim.cmd "packadd packer.nvim"

local plugins = {
    ["wbthomason/packer.nvim"] = {
        cmd = require("core.lazy_load").packer_cmds,
        config = function()
            require "plugins"
        end,
    },

    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function()
            require("core.lazy_load").on_file_open "nvim-treesitter"
        end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    -- git
    ["lewis6991/gitsigns.nvim"] = {
        ft = "gitcommit",
        setup = function()
            require("core.lazy_load").gitsigns()
        end,
        config = function()
            require("plugins.configs.others").gitsigns()
        end,
    },

    ['nvim-lua/plenary.nvim'] = {},

    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end,
        setup = function()
            require("core.utils").load_mappings "telescope"
        end,
    },

    -- lsp stuff

    ["williamboman/mason.nvim"] = {
        cmd = require("core.lazy_load").mason_cmds,
        config = function()
            require "plugins.configs.mason"
        end,
    },

    ["neovim/nvim-lspconfig"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lspconfig"
        end,
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    ["simrat39/rust-tools.nvim"] = {
        after = "nvim-lspconfig",
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

    ["rafamadriz/friendly-snippets"] = {
        module = { "cmp", "cmp_nvim_lsp" },
        event = "InsertEnter",
    },

    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        config = function()
            require "plugins.configs.cmp"
        end,
    },

    ["L3MON4D3/LuaSnip"] = {
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.others").luasnip()
        end,
    },

    ["saadparwaiz1/cmp_luasnip"] = {
        after = "LuaSnip",
    },

    ["hrsh7th/cmp-nvim-lua"] = {
        after = "cmp_luasnip",
    },

    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "cmp-nvim-lua",
    },

    ["hrsh7th/cmp-buffer"] = {
        after = "cmp-nvim-lsp",
    },

    ["hrsh7th/cmp-path"] = {
        after = "cmp-buffer",
    },

    -- misc
    ["windwp/nvim-autopairs"] = {
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.others").autopairs()
        end,
    },

    ["numToStr/Comment.nvim"] = {
        module = "Comment",
        keys = { "gc", "gb" },
        config = function()
            require("plugins.configs.others").comment()
        end,
        setup = function()
            require("core.utils").load_mappings "comment"
        end,
    },

    -- file managing , picker etc
    ["kyazdani42/nvim-tree.lua"] = {
        ft = "alpha",
        cmd = { "NvimTreeToggle" },
        config = function()
            require "plugins.configs.nvimtree"
        end,
        setup = function()
            require("core.utils").load_mappings "nvimtree"
        end,
    },

    ["krolyxon/kterm"] = {
        module = "kterm",
        config = function()
            require "plugins.configs.kterm"
        end,
        setup = function()
            require("core.utils").load_mappings "kterm"
        end,
    },

    -- UI stuff

    ["krolyxon/kdark"] = {
        config = function()
            local ok, kdark = pcall(require, "kdark")

            if ok then
                kdark.load_theme()
            end
        end,
    },

    ["lukas-reineke/indent-blankline.nvim"] = {
        event = "BufRead",
        config = function()
            require("plugins.configs.others").blankline()
        end,
        setup = function()
            require("core.utils").load_mappings "blankline"
        end,
    },

    ["krolyxon/nvim-colorizer.lua"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-colorizer.lua"
        end,
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    },

    ["nvim-lualine/lualine.nvim"] = {
        config = function()
            require("plugins.configs.statusline")
        end,
    },

    -- Only load whichkey after all the gui
    ["folke/which-key.nvim"] = {
        disable = false,
        module = "which-key",
        keys = "<leader>",
        config = function()
            require "plugins.configs.whichkey"
        end,
        setup = function()
            require("core.utils").load_mappings "whichkey"
        end,
    },
    -- speed up deffered plugins
    ["lewis6991/impatient.nvim"] = {},
}
require("core.packer").run(plugins)

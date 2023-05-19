-- require("ui").load_highlight "treesitter"

local options = {
    ensure_installed = {
        "lua",
        "rust",
        "c",
        "python",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

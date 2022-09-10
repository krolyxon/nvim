local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

require("colors").load_highlight "treesitter"

local options = {
    ensure_installed = {
        "lua",
        "rust",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
}

treesitter.setup(options)

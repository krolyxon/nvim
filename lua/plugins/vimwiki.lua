return {
    "vimwiki/vimwiki",
    lazy = false,
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
}

local M = {}

M.autopairs = function()
    local options = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
    }

    require("nvim-autopairs").setup(options)

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

M.luasnip = function()
    local options = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    }

    require("luasnip").config.set_config(options)
    require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
            if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
            then
                require("luasnip").unlink_current()
            end
        end,
    })
end

M.gitsigns = function()
    local options = {
        signs = {
            add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete = { hl = "GitSignsDelete", text = "󰍵", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        },
    }
    require("gitsigns").setup(options)
end

M.blankline = function()
    local options = {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
            "help",
            "terminal",
            "alpha",
            "lazy",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "nvchad_cheatsheet",
            "lsp-installer",
            "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
    }

    require("indent_blankline").setup(options)
end

M.colorizer = function()
    require("colorizer").setup()
    -- execute colorizer as soon as possible
    vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
    end, 0)
end

return M

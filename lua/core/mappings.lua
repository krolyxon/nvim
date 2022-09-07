local M = {}

M.general = {
    n = {
        ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "window left" },
        ["<C-l>"] = { "<C-w>l", "window right" },
        ["<C-j>"] = { "<C-w>j", "window down" },
        ["<C-k>"] = { "<C-w>k", "window up" },

        -- new buffer
        ["<leader>b"] = { "<cmd> enew <CR>", "new buffer" },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("core.utils").close_buffer()
            end,
            "close buffer",
        }
    },
}

M.nvimtree = {
    plugin = true,

    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

        -- focus
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    },
}

M.nvterm = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },
    },

    n = {
        -- toggle in normal mode
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<A-h>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },
    },
}
M.telescope = {
    plugin = true,

    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

        -- git
        ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope colorscheme<CR>", "colorthemes" },
    },
}

M.whichkey = {
    plugin = true,

    n = {
        ["<leader>wK"] = {
            function()
                vim.cmd "WhichKey"
            end,
            "which-key all keymaps",
        },
        ["<leader>wk"] = {
            function()
                local input = vim.fn.input "WhichKey: "
                vim.cmd("WhichKey " .. input)
            end,
            "which-key query lookup",
        },
    },
}

M.comment = {
    plugin = true,

    -- toggle comment in both modes
    n = {
        ["<leader>/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment",
        },
    },

    v = {
        ["<leader>/"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "toggle comment",
        },
    },
}

M.lspconfig = {
    plugin = true,

    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "lsp declaration",
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "lsp definition",
        },

        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "lsp hover",
        },

        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "lsp implementation",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "lsp signature_help",
        },

        ["<leader>D"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "lsp definition type",
        },

        ["<leader>ra"] = {
            function()
                require("nvchad_ui.renamer").open()
            end,
            "lsp rename",
        },

        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "lsp code_action",
        },

        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "lsp references",
        },

        ["<leader>f"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "floating diagnostic",
        },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "goto prev",
        },

        ["d]"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "goto_next",
        },

        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "diagnostic setloclist",
        },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.formatting {}
            end,
            "lsp formatting",
        },

        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "add workspace folder",
        },

        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "remove workspace folder",
        },

        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "list workspace folders",
        },
    },
}

M.rust = {
    plugin = true,
    n = {
        ["<leader>rr"] = { "<cmd> RustRun <CR>", "RustRun" },
        ["<leader>rR"] = { "<cmd> RustRunnables <CR>", "RustRunnables" },
        ["<leader>rd"] = { "<cmd> RustDebuggables <CR>", "RustDebuggables" },
        ["<leader>rha"] = { "<cmd> RustHoverActions <CR>", "RustHoverActions" },
        ["<leader>roc"] = { "<cmd> RustOpenCargo <CR>", "RustOpenCargo" },
        ["<leader>rcg"] = { "<cmd> RustViewCrateGraph <CR>", "RustViewCrateGraph" },
    },
}

M.blankline = {
    plugin = true,

    n = {
        ["<leader>cc"] = {
            function()
                local ok, start = require("indent_blankline.utils").get_current_context(
                    vim.g.indent_blankline_context_patterns,
                    vim.g.indent_blankline_use_treesitter_scope
                )

                if ok then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                    vim.cmd [[normal! _]]
                end
            end,

            "Jump to current_context",
        },
    },
}

return M

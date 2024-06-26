local M = {}

M.general = {
    n = {
        ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

        -- switch between windows
        -- ["<C-h>"] = { "<C-w>h", "window left" },
        -- ["<C-l>"] = { "<C-w>l", "window right" },
        -- ["<C-j>"] = { "<C-w>j", "window down" },
        -- ["<C-k>"] = { "<C-w>k", "window up" },

        -- cycleling through buffers
        ["tk"] = { "<cmd> bnext <CR>", "Next buffer" },
        ["tj"] = { "<cmd> bprev <CR>", "Previous buffer" },

        -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
        -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
        -- empty mode is same as using <cmd> :map
        -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },

        -- new buffer
        ["<leader>b"] = { "<cmd> enew <CR>", "new buffer" },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("core.utils").close_buffer()
            end,
            "close buffer",
        },

        ["<leader>d"] = { "\"_d", "delete without copying into clipboard" },

        -- motion keybinds
        ["<C-d>"] = { "<C-d>zz", "move forward half page" },
        ["<C-u>"] = { "<C-u>zz", "move backward half page" },

        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },

        ["<leader>pv"] = { "<cmd> Ex <CR>", "File Tree" },

        ["<leader>ex"] = { "<cmd>!chmod +x %<CR>", "Make the current buffer script executable", opts = { silent = true } },

        ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
    },

    v = {
        ["<leader>d"] = { "\"_d", "delete without copying into clipboard" },

        ["J"] = { ":m '>+1<CR>gv=gv" },
        ["K"] = { ":m '<-2<CR>gv=gv" },
    },

    x = {
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
    },
}

M.kterm = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<C-\\>"] = {
            function()
                require("kterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        -- ["<A-h>"] = {
        --     function()
        --         require("kterm.terminal").toggle "horizontal"
        --     end,
        --     "toggle horizontal term",
        -- },
        --
        -- ["<A-v>"] = {
        --     function()
        --         require("kterm.terminal").toggle "vertical"
        --     end,
        --     "toggle vertical term",
        -- },
    },

    n = {
        -- toggle in normal mode
        ["<C-\\>"] = {
            function()
                require("kterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        -- ["<A-h>"] = {
        --     function()
        --         require("kterm.terminal").toggle "horizontal"
        --     end,
        --     "toggle horizontal term",
        -- },
        --
        -- ["<A-v>"] = {
        --     function()
        --         require("kterm.terminal").toggle "vertical"
        --     end,
        --     "toggle vertical term",
        -- },
    },
}

M.nvimtree = {
    plugin = true,

    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

        -- focus
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
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
        ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

        -- git
        ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
        ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope colorscheme<CR>", "colorthemes" },
    },
}

M.fugitive = {
    plugin = true,
    n = {
        ["<leader>gs"] = { "<cmd> Git <CR>", "Git" }
    }
}

M.harpoon = {
    plugin = true,
    n = {
        ["<C-h>"] = { function() require("harpoon.ui").nav_file(1) end, "Harpoon File 1" },
        ["<C-j>"] = { function() require("harpoon.ui").nav_file(2) end, "Harpoon File 2" },
        ["<C-k>"] = { function() require("harpoon.ui").nav_file(3) end, "Harpoon File 3" },
        ["<C-l>"] = { function() require("harpoon.ui").nav_file(4) end, "Harpoon File 4" },

        ["<C-e>"] = { function() require("harpoon.ui").toggle_quick_menu() end, "Harpoon Toggle Quick Menu" },

        ["<leader>a"] = { function() require("harpoon.mark").add_file() end, "Harpoon Add File" },

    }
}

M.undotree = {
    plugin = true,
    n = {
        -- toggle
        ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "toggle undotree" },
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
                vim.diagnostic.goto_prev({ float = { border = "rounded" } })
            end,
            "goto prev",
        },

        ["]d"] = {
            function()
                vim.diagnostic.goto_next({ float = { border = "rounded" } })
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
                vim.lsp.buf.format { async = true }
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
        ["<leader>rr"] = { "<cmd> RustRun<CR>", "RustRun" },
        ["<leader>rd"] = { "<cmd> RustDebuggables <CR>", "RustDebuggables" },
        ["<leader>ra"] = { "<cmd> RustHoverActions <CR>", "RustHoverActions" },
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

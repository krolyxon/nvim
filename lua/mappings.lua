require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Flaoting Terminal
map({ "n", "t" }, "<C-\\>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- cycleling through buffers
map("n", "tk", "<cmd> bnext <CR>", { desc = "Next Buffer" })
map("n", "tj", "<cmd> bprev <CR>", { desc = "Previous Buffer" })

-- Substitute highlighted word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Harpoon keymaps
map("n", "<C-h>", function()
    require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon File 1" })
map("n", "<C-j>", function()
    require("harpoon.ui").nav_file(2)
end, { desc = "Harpoon File 2" })
map("n", "<C-k>", function()
    require("harpoon.ui").nav_file(3)
end, { desc = "Harpoon File 3" })
map("n", "<C-l>", function()
    require("harpoon.ui").nav_file(4)
end, { desc = "Harpoon File 4" })
map("n", "<C-e>", function()
    require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon Toggle Quick Menu" })
map("n", "<leader>a", function()
    require("harpoon.mark").add_file()
end, { desc = "Harpoon Add File" })
require("harpoon").setup()

-- Compiler.nvim
map("n", "<F4>", "<cmd>CompilerOpen<cr>")
map("n", "<S-F4>", "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>")
map("n", "<F5>", "<cmd>CompilerToggleResults<cr>")

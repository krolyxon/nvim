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
map("n", "tk", "<cmd> bnext <CR>", {desc = "Next Buffer"})
map("n", "tj", "<cmd> bprev <CR>", {desc = "Previous Buffer"})

local KrolyxonGroup = vim.api.nvim_create_augroup('Krolyxon', {})

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Remove trailing whitespaces on :w
autocmd({ "BufWritePre" }, {
    group = KrolyxonGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Don"t auto commenting new lines
autocmd("BufEnter", {
    pattern = "",
    command = "set fo-=c fo-=r fo-=o"
})

-- spell check markdown and tex files
vim.cmd([[
  augroup spellCheck
    autocmd!
    autocmd Filetype plaintext setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.rmd setlocal spell
    autocmd BufRead,BufNewFile *.Rmd setlocal spell
    autocmd BufRead,BufNewFile *.tex setlocal spell
  augroup END
]])


-- Run C/C++ fil
vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ':w<CR>:!gcc -o %:t:r % && ./%:t:r<CR>', {silent = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':w<CR>:!g++ -o %:t:r % && ./%:t:r<CR>', {silent = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<F7>', ':w<CR>:lua require("kterm.terminal").send("cp -f " .. vim.fn.expand("%") .. " /tmp; javac -d /tmp " .. vim.fn.expand("%") .. "; java " .. vim.fn.expand("%:t:r"), "float")<CR>', {silent = true})
-- vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ":w<CR>:new | term . '!gcc %:p:h && ./a.out'<CR>:startinsert<CR>", {silent = true})

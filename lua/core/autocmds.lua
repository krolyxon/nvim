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

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

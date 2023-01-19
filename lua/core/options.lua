local opt = vim.opt
local g = vim.g

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
g.vim_version = vim.version().minor
if g.vim_version < 8 then
    g.did_load_filetypes = 0
    g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.cmdheight = 1
opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line
opt.mouse = opt.mouse + "nv" -- mouse scrolling
opt.ignorecase = true
opt.smartcase = true
opt.showmode = false
opt.incsearch = true

-- numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- indentline
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
g.mapleader = " "

-- disable nvim intro
opt.shortmess:append "sI"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.timeoutlen = 400

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

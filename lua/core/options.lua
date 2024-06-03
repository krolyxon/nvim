local opt = vim.opt
local g = vim.g

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
opt.colorcolumn = "100"

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

opt.swapfile = false
opt.undodir = vim.fn.expand('~/.local/share/nvim/undodir')
opt.undofile = true

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

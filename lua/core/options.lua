local opt = vim.opt
local g = vim.g

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
g.vim_version = vim.version().minor
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.title = true
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


-- disable some builtin vim plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimball_plugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin ] = 1
end

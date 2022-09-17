local theme = require("colors.kdark").colors

local black = theme.black
local red = theme.red
local green = theme.green
local yellow = theme.yellow
local blue = theme.blue
local magenta = theme.magenta
local cyan = theme.cyan
local white = theme.white
local bright_black = theme.bright_black
local bright_red = theme.bright_red
local bright_green = theme.bright_green
local bright_yellow = theme.bright_yellow
local bright_blue = theme.bright_blue
local bright_magenta = theme.bright_magenta
local bright_cyan = theme.bright_cyan
local bright_white = theme.bright_white

return {

    Comment = { fg = bright_black },

    SignColumn = {
        bg = black,
    },

    -- line number
    LineNr = { fg = bright_black },
    CursorLineNr = { fg = white },

    CursorLine = {
        bg = '#131313',
        sp = "none",
    },

    -- those ugly ~'s
    EndOfBuffer = { fg = black },

    -- floating windows
    FloatBorder = { fg = blue },
    NormalFloat = { bg = black },

    -- Pmenu i.e completion menu
    Pmenu = { bg = black },
    PmenuSbar = { bg = black },
    PmenuSel = { bg = black, fg = white },
    PmenuThumb = { bg = bright_black },

    -- nvim cmp
    CmpItemAbbr = { fg = white },
    CmpItemAbbrMatch = { fg = blue, bold = true },
    CmpBorder = { fg = bright_black },
    CmpDocBorder = { fg = bright_black },

    NvimInternalError = { fg = red },
    WinSeparator = { fg = bright_black },

    -- Dashboard i.e alpha.nvim
    AlphaHeader = { fg = bright_black },
    AlphaButtons = { fg = bright_black },

    -- Gitsigns.nvim
    DiffAdd = {
        fg = blue,
    },

    DiffAdded = {
        fg = green,
    },

    DiffChange = {
        fg = bright_black,
    },

    DiffChangeDelete = {
        fg = red,
    },

    DiffModified = {
        fg = yellow,
    },

    DiffDelete = {
        fg = red,
    },

    DiffRemoved = {
        fg = red,
    },

    -- Indent blankline
    IndentBlanklineChar = { fg = bright_black },
    IndentBlanklineSpaceChar = { fg = bright_black },

    -- Lsp Diagnostics
    DiagnosticHint = { fg = magenta },
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticInformation = { fg = green },

    -- NvimTree
    NvimTreeEmptyFolderName = { fg = bright_blue },
    NvimTreeEndOfBuffer = { fg = black },
    NvimTreeFolderIcon = { fg = bright_blue },
    NvimTreeFolderName = { fg = bright_blue },
    NvimTreeGitDirty = { fg = red },
    NvimTreeIndentMarker = { fg = bright_black },
    NvimTreeNormal = { bg = '#000000' },
    NvimTreeNormalNC = { bg = '#000000' },
    NvimTreeOpenedFolderName = { fg = bright_blue },
    NvimTreeGitIgnored = { fg = bright_black },

    NvimTreeWinSeparator = {
        fg = '#000000',
        bg = '#000000',
    },

    NvimTreeWindowPicker = {
        fg = red,
        bg = black,
    },

    NvimTreeCursorLine = {
        bg = black,
    },

    -- StatusLine = {
    --     fg = white,
    -- },
    -- StatusLineNC = {
    --     fg = white,
    -- },
    -- StatusLineSeparator = {
    --     fg = bright_black,
    -- },
    -- StatusLineTerm = {
    --     fg = bright_black,
    -- },
    -- StatusLineTermNC = {
    --     fg = bright_black,
    -- },
}

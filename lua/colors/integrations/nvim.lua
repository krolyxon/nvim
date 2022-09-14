local theme = require("colors.kdark").colors

local black = theme.black -- base00
local red = theme.red -- base01
local green = theme.green -- base02
local yellow = theme.yellow -- base03
local blue = theme.blue -- base04
local magenta = theme.magenta -- base05
local cyan = theme.cyan -- base06
local white = theme.white -- base07
local bright_black = theme.bright_black -- base08
local bright_red = theme.bright_red -- base09
local bright_green = theme.bright_green -- base0A
local bright_yellow = theme.bright_yellow -- base0B
local bright_blue = theme.bright_blue -- base0C
local bright_magenta = theme.bright_magenta -- base0D
local bright_cyan = theme.bright_cyan -- base0E
local bright_white = theme.bright_white -- base0F

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

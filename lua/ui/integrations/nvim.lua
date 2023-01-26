local theme = require("ui.kdark").colors

return {
    Comment = { fg = theme.bright_black },

    SignColumn = {
        bg = theme.black,
    },

    -- line number
    LineNr = { fg = theme.bright_black },
    CursorLineNr = { fg = theme.white },

    CursorLine = {
        bg = '#131313',
        sp = "none",
    },

    -- those ugly ~'s
    EndOfBuffer = { fg = theme.black },

    -- floating windows
    FloatBorder = { fg = theme.blue },
    NormalFloat = { bg = theme.black },

    -- Pmenu i.e completion menu
    Pmenu = { bg = theme.black },
    PmenuSbar = { bg = theme.black },
    PmenuSel = { bg = '#26233a', fg = theme.white },
    PmenuThumb = { bg = theme.bright_black },

    -- nvim cmp
    CmpItemAbbr = { fg = theme.white },
    CmpItemAbbrMatch = { fg = theme.blue, bold = true },
    CmpBorder = { fg = theme.bright_black },
    CmpDocBorder = { fg = theme.bright_black },

    NvimInternalError = { fg = theme.red },
    WinSeparator = { fg = theme.bright_black },

    -- Dashboard i.e alpha.nvim
    AlphaHeader = { fg = theme.bright_black },
    AlphaButtons = { fg = theme.bright_black },

    -- Gitsigns.nvim
    DiffAdd = {
        fg = theme.blue,
    },

    DiffAdded = {
        fg = theme.green,
    },

    DiffChange = {
        fg = theme.bright_black,
    },

    DiffChangeDelete = {
        fg = theme.red,
    },

    DiffModified = {
        fg = theme.yellow,
    },

    DiffDelete = {
        fg = theme.red,
    },

    DiffRemoved = {
        fg = theme.red,
    },

    -- Indent blankline
    IndentBlanklineChar = { fg = theme.bright_black },
    IndentBlanklineSpaceChar = { fg = theme.bright_black },

    -- Lsp Diagnostics
    DiagnosticHint = { fg = theme.magenta },
    DiagnosticError = { fg = theme.red },
    DiagnosticWarn = { fg = theme.yellow },
    DiagnosticInformation = { fg = theme.green },

    -- StatusLine = {
    --     fg = theme.white,
    -- },
    -- StatusLineNC = {
    --     fg = theme.white,
    -- },
    -- StatusLineSeparator = {
    --     fg = theme.bright_black,
    -- },
    -- StatusLineTerm = {
    --     fg = theme.bright_black,
    -- },
    -- StatusLineTermNC = {
    --     fg = theme.bright_black,
    -- },
}

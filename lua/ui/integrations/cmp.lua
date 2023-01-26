local theme = require("ui.kdark").colors

return {
    CmpItemAbbr = { fg = theme.bright_black },
    CmpItemAbbrMatch = { fg = theme.white, bold = true },
    CmpItemAbbrDeprecated = { fg = theme.bright_black, strikethrough = true },
    CmpItemAbbrMatchFuzzy = { fg = theme.white, bold = true },
    CmpItemKind = { fg = theme.magenta },
    CmpItemKindClass = { fg = theme.yellow },
    CmpItemKindFunction = { fg = theme.magenta },
    CmpItemKindInterface = { fg = theme.yellow },
    CmpItemKindMethod = { fg = theme.magenta },
    CmpItemKindSnippet = { fg = theme.magenta },
    CmpItemKindVariable = { fg = theme.cyan },
}

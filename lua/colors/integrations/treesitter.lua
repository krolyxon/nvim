local theme = require("colors.kdark").colors

return {
    TSAnnotation = {
        fg = theme.orange,
        sp = "none",
    },

    TSAttribute = {
        fg = theme.bright_green,
        sp = "none",
    },

    TSCharacter = {
        fg = theme.magenta,
        sp = "none",
    },

    TSConstBuiltin = {
        fg = theme.bright_yellow,
        sp = "none",
    },

    TSConstMacro = {
        fg = theme.magenta,
        sp = "none",
    },

    TSError = {
        fg = theme.red,
        sp = "none",
    },

    TSException = {
        fg = theme.magenta,
        sp = "none",
    },

    TSFloat = {
        fg = theme.bright_yellow,
        sp = "none",
    },

    TSFuncBuiltin = {
        fg = theme.bright_blue,
        sp = "none",
    },

    TSFuncMacro = {
        fg = theme.magenta,
        sp = "none",
    },

    TSKeywordOperator = {
        fg = theme.bright_magenta,
        sp = "none",
    },

    TSMethod = {
        fg = theme.bright_blue,
        sp = "none",
    },

    TSNamespace = {
        fg = theme.magenta,
        sp = "none",
    },

    TSNone = {
        fg = theme.gray,
        sp = "none",
    },

    TSParameter = {
        fg = theme.magenta,
        sp = "none",
    },

    TSParameterReference = {
        fg = theme.gray,
        sp = "none",
    },

    TSPunctDelimiter = {
        fg = theme.orange,
        sp = "none",
    },

    TSPunctSpecial = {
        fg = theme.gray,
        sp = "none",
    },

    TSStringRegex = {
        fg = theme.cyan,
        sp = "none",
    },

    TSStringEscape = {
        fg = theme.cyan,
        sp = "none",
    },

    TSSymbol = {
        fg = theme.bright_green,
        sp = "none",
    },

    TSTagDelimiter = {
        fg = theme.orange,
        sp = "none",
    },

    TSText = {
        fg = theme.gray,
        sp = "none",
    },

    TSStrong = {
        bold = true,
    },

    TSEmphasis = {
        fg = theme.base09,
        sp = "none",
    },

    TSStrike = {
        fg = theme.black,
        sp = "none",
        strikethrough = true,
    },

    TSLiteral = {
        fg = theme.bright_magenta,
        sp = "none",
    },

    TSURI = {
        fg = theme.bright_magenta,
        sp = "none",
        underline = true,
    },

    TSTypeBuiltin = {
        fg = theme.yellow,
        sp = "none",
    },

    TSVariableBuiltin = {
        fg = theme.bright_yellow,
        sp = "none",
    },

    TSDefinition = {
        sp = theme.blue,
        underline = true,
    },

    TSDefinitionUsage = {
        sp = theme.bright_black,
        underline = true,
    },

    TSCurrentScope = {
        bold = true,
    },
}

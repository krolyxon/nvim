local theme = require("colors.kdark").colors

local black = theme.black                      -- base00
local red = theme.red                          -- base01
local green = theme.green                      -- base02
local yellow = theme.yellow                    -- base03
local blue = theme.blue                        -- base04
local magenta = theme.magenta                  -- base05
local cyan = theme.cyan                        -- base06
local white = theme.white                      -- base07
local bright_black = theme.bright_black        -- base08
local bright_red = theme.bright_red            -- base09
local bright_green = theme.bright_green        -- base0A
local bright_yellow = theme.bright_yellow      -- base0B
local bright_blue = theme.bright_blue          -- base0C
local bright_magenta = theme.bright_magenta    -- base0D
local bright_cyan = theme.bright_cyan          -- base0E
local bright_white = theme.bright_white        -- base0F
local orange = theme.orange
local gray = theme.gray

return {
   TSAnnotation = {
      fg = orange,
      sp = "none",
   },

   TSAttribute = {
      fg = bright_green,
      sp = "none",
   },

   TSCharacter = {
      fg = magenta,
      sp = "none",
   },

   TSConstBuiltin = {
      fg = bright_yellow,
      sp = "none",
   },

   TSConstMacro = {
      fg = magenta,
      sp = "none",
   },

   TSError = {
      fg =  red,
      sp = "none",
   },

   TSException = {
      fg = magenta,
      sp = "none",
   },

   TSFloat = {
      fg = bright_yellow,
      sp = "none",
   },

   TSFuncBuiltin = {
      fg = bright_blue,
      sp = "none",
   },

   TSFuncMacro = {
      fg = magenta,
      sp = "none",
   },

   TSKeywordOperator = {
      fg = bright_magenta,
      sp = "none",
   },

   TSMethod = {
      fg = bright_blue,
      sp = "none",
   },

   TSNamespace = {
      fg = magenta,
      sp = "none",
   },

   TSNone = {
      fg = gray,
      sp = "none",
   },

   TSParameter = {
      fg = magenta,
      sp = "none",
   },

   TSParameterReference = {
      fg = gray,
      sp = "none",
   },

   TSPunctDelimiter = {
      fg = orange,
      sp = "none",
   },

   TSPunctSpecial = {
      fg = gray,
      sp = "none",
   },

   TSStringRegex = {
      fg = cyan,
      sp = "none",
   },

   TSStringEscape = {
      fg = cyan,
      sp = "none",
   },

   TSSymbol = {
      fg = bright_green,
      sp = "none",
   },

   TSTagDelimiter = {
      fg = orange,
      sp = "none",
   },

   TSText = {
      fg = gray,
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
      fg = black,
      sp = "none",
      strikethrough = true,
   },

   TSLiteral = {
      fg = bright_magenta,
      sp = "none",
   },

   TSURI = {
      fg = bright_magenta,
      sp = "none",
      underline = true,
   },

   TSTypeBuiltin = {
      fg = yellow,
      sp = "none",
   },

   TSVariableBuiltin = {
      fg = bright_yellow,
      sp = "none",
   },

   TSDefinition = {
      sp = blue,
      underline = true,
   },

   TSDefinitionUsage = {
      sp = bright_black,
      underline = true,
   },

   TSCurrentScope = {
      bold = true,
   },
}

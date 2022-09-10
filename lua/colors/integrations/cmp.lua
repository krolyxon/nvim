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
   CmpItemKindConstant = { fg = bright_red },
   CmpItemKindFunction = { fg = bright_magenta },
   CmpItemKindIdentifier = { fg = bright_black },
   CmpItemKindField = { fg = bright_black },
   CmpItemKindVariable = { fg = bright_cyan },
   Special = { fg = bright_blue },
   CmpItemKindSnippet = { fg = red },
   CmpItemKindText = { fg = bright_yellow },
   CmpItemKindStructure = { fg = bright_cyan },
   CmpItemKindType = { fg = bright_green },
   CmpItemKindKeyword = { fg = white },
   CmpItemKindMethod = { fg = bright_magenta },
   CmpItemKindConstructor = { fg = blue },
   CmpItemKindFolder = { fg = white },
   CmpItemKindModule = { fg = bright_green },
   CmpItemKindProperty = { fg = bright_black },
   CmpItemKindUnit = { fg = bright_cyan },
   CmpItemKindFile = { fg = white },
   CmpItemKindColor = { fg = red },
   CmpItemKindReference = { fg = magenta },
   CmpItemKindStruct = { fg = bright_cyan },
   CmpItemKindOperator = { fg = magenta },
   CmpItemKindTypeParameter = { fg = bright_black },
}

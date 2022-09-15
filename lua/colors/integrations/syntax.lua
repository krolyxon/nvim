local theme = require("colors.kdark").colors

-- Standard syntax highlighting
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
local orange = theme.orange
local gray = theme.gray

return {
   Boolean = {
      fg = orange,
   },

   Character = {
      fg = magenta,
   },

   Conditional = {
      fg = magenta,
   },

   Constant = {
      fg = magenta,
   },

   Define = {
      fg = magenta,
      sp = "none",
   },

   Delimiter = {
      fg = orange,
   },

   Float = {
      fg = yellow,
   },

   Function = {
      fg = bright_blue,
   },

   Identifier = {
      fg = magenta,
      sp = "none",
   },

   Include = {
      fg = bright_blue,
   },

   Keyword = {
      fg = magenta,
   },

   Label = {
      fg = yellow,
   },

   Number = {
      fg = yellow,
   },

   Operator = {
      fg = gray,
      sp = "none",
   },

   PreProc = {
      fg = yellow,
   },

   Repeat = {
      fg = yellow,
   },

   Special = {
      fg = bright_blue,
   },

   SpecialChar = {
      fg = orange,
   },

   Statement = {
      fg = magenta,
   },

   StorageClass = {
      fg = yellow,
   },

   String = {
      fg = bright_green,
   },

   Structure = {
      fg = magenta,
   },

   Tag = {
      fg = yellow,
   },

   Todo = {
      fg = yellow,
      bg = bright_black,
   },

   Type = {
      fg = yellow,
      sp = "none",
   },

   Typedef = {
      fg = yellow,
   },
}

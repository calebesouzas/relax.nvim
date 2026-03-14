-- lua/lush_theme/relax.lua
-- The file where we build our theme

local lush = require('lush')
local hsl = lush.hsl

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local colors = {
    background = hsl(281, 27, 14),
    red = hsl(351, 90, 58),
    orange = hsl(40, 100, 50),
    purple = hsl(270, 100, 70),
    pink = hsl(295, 100, 75),
    cream = hsl(238, 93, 83),
    ice = hsl(199, 100, 91),
    green = hsl(150, 80, 50),
    lime = hsl(150, 100, 80),
    blue = hsl(220, 100, 70),
    yellow = hsl(53, 100, 60),
    comment = hsl(199, 100, 41),
    white = hsl(0, 0, 100),
    gray = hsl(0, 0, 80),
  }

  return {
    -- Neovim default colors --
    Normal { bg = colors.background, fg = colors.white },
    Delimiter { fg = colors.gray },
    Comment { fg = colors.comment },

    Identifier { fg = colors.ice.da(15) },
    Function { fg = colors.cream },
    Keyword { fg = colors.blue },
    Statement { fg = colors.purple.li(21) },
    String { fg = colors.green },
    Type { fg = colors.red },
    Constant { fg = colors.orange },
    Error { fg = colors.red.da(20) },
    Special { fg = colors.ice },

    -- CursorLine { fg = colors.background },
    CursorLineNr { fg = colors.background.li(50) },

    -- C specific colors --
    cTypedef { Keyword },
    PreProc { fg = colors.green },
    cBlock { Keyword },

    -- TreeSitter colors --
    sym "@variable" { fg = Normal.fg.da(8) },
    sym "@variable.member" { Identifier },
    sym "@variable.parameter" { fg = colors.ice },
    sym "@constant.builtin" { fg = colors.yellow },
    sym "@number" { fg = Constant.fg.li(10).ro(5) },
    sym "@type" { fg = colors.red },
    sym "@type.builtin" { fg = sym("@type").fg.li(30) },
    sym "@keyword.import" { fg = colors.blue.li(45) },
    sym "@keyword.directive" { fg = colors.blue.li(45) },
    sym "@keyword.modifier" { fg = colors.pink },
    sym "@keyword.repeat" { Statement },
    sym "@keyword.conditional" { Statement },
    sym "@character" { String },
    sym "@string" { String },
    sym "@string.escape" { fg = colors.lime },
    sym "@boolean" { fg = colors.yellow },
    sym "@operator" { fg = colors.gray.da(10) },
  }
end)

return theme


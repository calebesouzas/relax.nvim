-- lua/lush_theme/relax.lua
-- The file where we build our theme

local lush = require('lush')
local hsl = lush.hsl

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local colors = {
    background = hsl(281, 27, 14),
    red = hsl(343, 100, 50),
    orange = hsl(24, 100, 50),
    purple = hsl(270, 100, 50),
    pink = hsl(290, 100, 50),
    cream = hsl(238, 93, 83),
    ice = hsl(199, 100, 91),
    white = hsl(0, 0, 100),
    green = hsl(150, 80, 50),
    blue = hsl(220, 100, 70),
  }

  return {
    -- Neovim default colors --
    Normal { bg = colors.background, fg = colors.white },
    Comment { fg = colors.ice.da(55).da(15) },

    Identifier { fg = colors.ice.da(15) },
    Function { fg = colors.cream },
    Keyword { fg = colors.blue },
    Statement { fg = colors.purple.li(21) },
    String { fg = colors.green },
    Type { fg = colors.red },
    Constant { fg = colors.orange.li(35) },
    Error { fg = colors.red.da(20) },
    Special { fg = colors.cream.ro(-35) },

    -- CursorLine { fg = colors.background },
    CursorLineNr { fg = colors.background.li(50) },

    -- C specific colors --
    cTypedef { Keyword },
    PreProc { fg = colors.green },
    cBlock { Keyword },

    -- TreeSitter colors --
    sym "@variable" { fg = Normal.fg.da(8) },
    sym "@variable.member" { Identifier },
    sym "@type" { fg = colors.red },
    sym "@type.builtin" { fg = sym("@type").fg.li(30).ro(10).sa(10) },
    sym "@keyword.import" { fg = colors.blue.li(45) },
    sym "@keyword.directive" { fg = colors.blue.li(45) }
  }
end)

return theme


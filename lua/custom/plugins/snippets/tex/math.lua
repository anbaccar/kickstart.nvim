local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local line_begin = require('luasnip.extras.expand_conditions').line_begin
local autosnippet = ls.extend_decorator.apply(s, { snippetType = 'autosnippet' })
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
local tex = {}
tex.in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
  return not tex.in_mathzone()
end

return {
  autosnippet({ trig = 'sr', wordTrig = false }, { t '^2' }, { condition = tex.in_math, show_condition = tex.in_math }),
  autosnippet({ trig = 'cb', wordTrig = false }, { t '^3' }, { condition = tex.in_math, show_condition = tex.in_math }),
  autosnippet({ trig = 'compl', wordTrig = false }, { t '^{c}' }, { condition = tex.in_math, show_condition = tex.in_math }),
  autosnippet({ trig = 'vtr', wordTrig = false }, { t '^{T}' }, { condition = tex.in_math, show_condition = tex.in_math }),
  autosnippet({ trig = 'inv', wordTrig = false }, { t '^{-1}' }, { condition = tex.in_math, show_condition = tex.in_math }),
  s(
    { trig = 'ff', snippetType = 'autosnippet' },
    fmta('\\frac{<>}{<>}', {
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone } -- `condition` option passed in the snippet `opts` table
  ),
  s(
    { trig = 'ff', snippetType = 'autosnippet' },
    fmta('\\frac{<>}{<>}', {
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone } -- `condition` option passed in the snippet `opts` table
  ),
  s(
    { trig = '([%a%)%]%}])^^', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>^{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone } -- `condition` option passed in the snippet `opts` table
  ),

  s(
    { trig = '([%a%)%]%}])__', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>_{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone } -- `condition` option passed in the snippet `opts` table
  ),
  s(
    { trig = '([^%a])pd', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\prod{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = '([^%a])sM', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\sum_{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  -- SUM with upper and lower limit
  s(
    { trig = '([^%a])smm', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\sum_{<>}^{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, 'i = 0'),
      i(2, '\\infty'),
    }),
    { condition = tex.in_mathzone }
  ),
  -- INTEGRAL with upper and lower limit
  s(
    { trig = '([^%a])intt', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\int_{<>}^{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- INTEGRAL from positive to negative infinity
  s(
    { trig = '([^%a])intf', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\int_{\\infty}^{\\infty}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  -- ABSOLUTE VALUE
  s(
    { trig = '([^%a])aa', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>\\abs{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- norm
  s(
    { trig = '([^%a])nor', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>\\norm{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- SQUARE ROOT
  s(
    { trig = '([^%\\])sq', wordTrig = false, regTrig = true, snippetType = 'autosnippet' },
    fmta('<>\\sqrt{<>}', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
}

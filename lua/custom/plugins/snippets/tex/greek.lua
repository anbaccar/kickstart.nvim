local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s({ trig = ';a', snippetType = 'autosnippet' }, {
    t '\\alpha',
  }, { condition = in_mathzone }),
  s({ trig = ';b', snippetType = 'autosnippet' }, {
    t '\\beta',
  }, { condition = in_mathzone }),
  s({ trig = ';g', snippetType = 'autosnippet' }, {
    t '\\gamma',
  }, { condition = in_mathzone }),
  s({ trig = ';D', snippetType = 'autosnippet' }, {
    t '\\Delta',
  }, { condition = in_mathzone }),
  s({ trig = ';d', snippetType = 'autosnippet' }, {
    t '\\delta',
  }, { condition = in_mathzone }),
  s({ trig = ';e', snippetType = 'autosnippet' }, {
    t '\\epsilon    ',
  }, { condition = in_mathzone }),
  s({ trig = ';ve', snippetType = 'autosnippet' }, {
    t '\\varepsilon',
  }, { condition = in_mathzone }),
  s({ trig = ';h', snippetType = 'autosnippet' }, {
    t '\\eta',
  }, { condition = in_mathzone }),
  s({ trig = ';vo', snippetType = 'autosnippet' }, {
    t '\\vartheta',
  }, { condition = in_mathzone }),
  s({ trig = ';o', snippetType = 'autosnippet' }, {
    t '\\theta',
  }, { condition = in_mathzone }),
  s({ trig = ';O', snippetType = 'autosnippet' }, {
    t '\\Theta',
  }, { condition = in_mathzone }),
  s({ trig = ';k', snippetType = 'autosnippet' }, {
    t '\\kappa',
  }, { condition = in_mathzone }),
  s({ trig = ';l', snippetType = 'autosnippet' }, {
    t '\\lambda',
  }, { condition = in_mathzone }),
  s({ trig = ';L', snippetType = 'autosnippet' }, {
    t '\\Lambda',
  }, { condition = in_mathzone }),
  s({ trig = ';m', snippetType = 'autosnippet' }, {
    t '\\mu',
  }, { condition = in_mathzone }),
  s({ trig = ';n', snippetType = 'autosnippet' }, {
    t '\\nu',
  }, { condition = in_mathzone }),
  s({ trig = ';x', snippetType = 'autosnippet' }, {
    t '\\xi',
  }, { condition = in_mathzone }),
  s({ trig = ';X', snippetType = 'autosnippet' }, {
    t '\\Xi',
  }, { condition = in_mathzone }),
  s({ trig = ';i', snippetType = 'autosnippet' }, {
    t '\\pi',
  }, { condition = in_mathzone }),
  s({ trig = ';I', snippetType = 'autosnippet' }, {
    t '\\Pi',
  }, { condition = in_mathzone }),
  s({ trig = ';r', snippetType = 'autosnippet' }, {
    t '\\rho',
  }, { condition = in_mathzone }),
  s({ trig = ';s', snippetType = 'autosnippet' }, {
    t '\\sigma',
  }, { condition = in_mathzone }),
  s({ trig = ';S', snippetType = 'autosnippet' }, {
    t '\\Sigma',
  }, { condition = in_mathzone }),
  s({ trig = ';t', snippetType = 'autosnippet' }, {
    t '\\tau',
  }, { condition = in_mathzone }),
  s({ trig = ';F', snippetType = 'autosnippet' }, {
    t '\\Phi',
  }, { condition = in_mathzone }),
  s({ trig = ';f', snippetType = 'autosnippet' }, {
    t '\\phi',
  }, { condition = in_mathzone }),
  s({ trig = ';vf', snippetType = 'autosnippet' }, {
    t '\\varphi',
  }, { condition = in_mathzone }),
  s({ trig = ';c', snippetType = 'autosnippet' }, {
    t '\\chi',
  }, { condition = in_mathzone }),
  s({ trig = ';P', snippetType = 'autosnippet' }, {
    t '\\Psi',
  }, { condition = in_mathzone }),
  s({ trig = ';p', snippetType = 'autosnippet' }, {
    t '\\psi',
  }, { condition = in_mathzone }),
  s({ trig = ';W', snippetType = 'autosnippet' }, {
    t '\\Omega',
  }, { condition = in_mathzone }),
  s({ trig = ';w', snippetType = 'autosnippet' }, {
    t '\\omega',
  }, { condition = in_mathzone }),
}

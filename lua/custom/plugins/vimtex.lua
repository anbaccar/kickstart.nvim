return {
  'lervag/vimtex',
  dependencies = { 'mofiqul/dracula.nvim' },
  lazy = false, -- we don't want to lazy load vimtex
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.o.conceallevel = 1
    vim.g.tex_conceal = ''
    vim.g.tex_fast = 'bmpr'

    vim.cmd [[
        let g:vimtex_quickfix_ignore_filters = [
        \'underfull',
          \'overfull',
          \]
        ]]
    vim.cmd [[
      let g:vimtex_complete_bib = {
      \ 'abbr_fmt' : '[@type] @author_short (@year)',
      \ 'menu_fmt' : '@title',
      \}

      ]]

    vim.g.vimtex_quickfix_enabled = 0
    vim.g.vimtex_match_paren_enabled = 0
    -- vim.g.vimtex_format_enabled = 1

    vim.g.vimtex_syntax_nospell_comments = 1

    if vim.loop.os_uname().sysname == 'darwin' then
      vim.g.vimtex_view_method = 'skim'
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
    else
      vim.g.vimtex_view_method = 'zathura'
    end

    local colors = require('dracula').colors()

    vim.cmd.hi('texcmdmath  guifg=' .. colors['red'])
    vim.cmd.hi('conceal  guifg=' .. colors['bright_cyan'])
    vim.cmd.hi('texdelim  guifg=' .. colors['pink'])
    vim.cmd.hi('texmathdelimzoneti  guifg=' .. colors['yellow'])
    -- vim.cmd.hi('texmathzone  guifg=' .. colors['cyan'])
    vim.cmd.hi('texrefarg gui=italic  guifg=' .. colors['bright_blue'])
    vim.cmd.hi('texcmdpart  guifg=' .. colors['bright_cyan'])
    vim.cmd.hi('texpartargtitle  gui=bold      guifg=' .. colors['bright_yellow'])
    -- vim.cmd.hi('texcmd  guifg=' .. colors['cyan'])
    vim.cmd.hi('texcmdref  guifg=' .. colors['pink'])
    vim.cmd.hi('texenvargname gui=italic guifg=' .. colors['orange'])
    vim.cmd.hi('texmathenvargname gui=italic guifg=' .. colors['orange'])
    vim.cmd.hi('texdefargname  gui=italic guifg=' .. colors['orange'])
    vim.cmd.hi('texmathzone  gui=italic guifg=' .. colors['bright_cyan'])
    vim.cmd.hi('texcmdmath  gui=italic guifg=' .. colors['bright_cyan'])
    vim.cmd.hi('texcmdnew   guifg=' .. colors['pink'])
    vim.cmd.hi('texargnew   guifg=' .. colors['bright_cyan'])
    -- vim.cmd.hi('texdefparm   guifg=' .. colors['bright_cyan'])
    -- hi! def link conceal guifg=color ctermfg=color
    -- vim.g.vimtex_view_general_viewer = 'zathura'
    -- vim.g.vimtex_view_zathura_options = '-reuse-instance'
  end,
}

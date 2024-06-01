-- return
-- {
-- 'ggandor/leap',
-- dependencies = { 'tpope/vim-repeat'},
-- event = 'VimEnter',
-- init = function()
--   vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndoTree' })
-- end,
-- }
return { -- LSP Configuration & Plugins
  enabled = false,
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat', 'Mofiqul/dracula.nvim' },
  event = 'VimEnter',
  config = function()
    -- vim.keymap.set('n', '<leader>f', '<Plug>(leap)')
    vim.keymap.set({'n', 'x', 'o'}, '<leader>f',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, '<leader>F',  '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    -- require('leap').opts.special_keys.prev_target = '<backspace>'
    -- require('leap').opts.special_keys.prev_group = '<backspace>'

    -- require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    -- require('leap').create_default_mappings()
    -- vim.keymap.set('n', 's', '<Plug>(leap)')
    -- vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
    -- vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
    -- vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')
    -- vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', { desc = 'Leap forward' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', { desc = 'Leap backward' })
    local colors = require('dracula').colors()
    --
    -- vim.cmd.hi('LeapLabelPrimary guibg=' .. colors['bright_red'] .. ' guifg=' .. colors['black'])
    -- vim.cmd.hi('LeapLabelSecondary guibg=' .. colors['bright_green'] .. ' guifg=' .. colors['black'])
    -- vim.api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})
    -- vim.cmd.hi('LeapBackdrop guifg=' .. colors['black'])
    -- vim.api.nvim_set_hl('0', 'LeapLabelPrimary', { fg = 'white', bg = #eeaaaa, bold = true })
    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#707070' })

    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { bg = '#1c1c1c', })
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)', { desc = 'Leap from window' })

    vim.api.nvim_create_augroup('LeapHighlights', { clear = false })
    vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
      group = 'LeapHighlights',
      pattern = { '*' },
      callback = function()
        vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey

        vim.api.nvim_set_hl(0, 'LeapMatch', {
          fg = colors['red'],
          bold = true,
          nocombine = true,
        })

        vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
          fg = colors['red'],
          bold = true,
          nocombine = true,
        })

        vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
          fg = colors['cyan'],
          bold = true,
          nocombine = true,
        })
      end,
    })
    vim.api.nvim_exec_autocmds('ColorScheme', { group = 'LeapHighlights' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, '<leader>f', '<Plug>(leap)', { desc = 'Leap forward' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, '<leader>F', '<Plug>(leap-backward)', { desc = 'Leap backward' })
    -- vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gf', '<Plug>(leap-from-window)', { desc = 'Leap from window' })
  end,
}

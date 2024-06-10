return {
  'smoka7/hop.nvim',

  enabled = false,
  dependencies = { 'Mofiqul/dracula.nvim' },
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    -- local hop = require 'hop'
    -- local builtin_targets = require 'hop.jump_target'
    -- local builtin_targets2 = require 'hop.jump_regex'
    --
    -- _G._repeated_hop_state = {
    --   last_chars = nil,
    --   count = 0,
    -- }
    --
    -- _G._repeatable_hop = function()
    --   for i = 1, _G._repeated_hop_state.count do
    --     hop.hint_with(
    --       builtin_targets.jump_target_generator(builtin_targets2.regex_by_case_searching(_G._repeated_hop_state.last_chars, true, hop.opts)),
    --       hop.opts
    --     )
    --   end
    -- end
    --
    -- hop.setup {}
    -- vim.keymap.set('n', [[f]], function()
    --   local char
    --   while true do
    --     vim.api.nvim_echo({ { 'hop 1 char:', 'Search' } }, false, {})
    --     local code = vim.fn.getchar()
    --     -- fixme: custom char range by needs
    --     if code >= 61 and code <= 0x7a then
    --       -- [a-z]
    --       char = string.char(code)
    --       break
    --     elseif code == 0x20 or code == 0x1b then
    --       -- press space, esc to cancel
    --       char = nil
    --       break
    --     end
    --   end
    --   if not char then
    --     return
    --   end
    --
    --   -- setup the state to pickup in _G._repeatable_hop
    --   _G._repeated_hop_state = {
    --     last_chars = char,
    --     count = (vim.v.count or 0) + 1,
    --   }
    --
    --   vim.go.operatorfunc = 'v:lua._repeatable_hop'
    --   -- return this↓ to run that↑
    --   return 'g@l' -- see expr=true
    -- end, {
    --   noremap = true,
    --   -- ↓ see "g@l"
    --   expr = true,
    -- })
    --
    -- place this in one of your configuration file(s)
    require('hop').setup {}
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('n', '<leader>jw', function()
      hop.hint_patterns { direction = directions.AFTER_CURSOR, current_line_only = false }
    end, { remap = true })
    vim.keymap.set('n', '<leader>jW', function()
      hop.hint_patterns { direction = directions.BEFORE_CURSOR, current_line_only = false }
    end, { remap = true })
    -- vim.keymap.set('', 't', function()
    --   hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }
    -- end, { remap = true })
    -- vim.keymap.set('', 'T', function()
    --   hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 }
    -- end, { remap = true })

    vim.keymap.set('', '<leader>jl', function()
      hop.hint_lines_skip_whitespace { current_line_only = false, hint_offset = 1 }
    end, { remap = true })

    local colors = require('dracula').colors()
    vim.api.nvim_set_hl(0, 'HopUnmatched', { link = 'Comment' })
    -- vim.api.nvim_set_hl(0, "HopNextKey", {link = "Comment"})
    -- vim.api.nvim_set_hl(0, "HopNextKey1", {link = "Comment"})
    -- vim.api.nvim_set_hl(0, "HopNextKey2", {link = "Comment"})

    vim.api.nvim_set_hl(0, 'HopPreview', {
      fg = colors['green'],
      bold = true,
      -- nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'HopNextKey', {
      fg = colors['red'],
      bold = true,
      -- nocombine = true,
    })
    --
    vim.api.nvim_set_hl(0, 'HopNextKey1', {
      fg = colors['red'],
      bold = true,
      -- nocombine = true,
    })

    vim.api.nvim_set_hl(0, 'HopNextKey2', {
      fg = colors['bright_red'],
      bold = true,
      -- nocombine = true,
    })
  end,
}

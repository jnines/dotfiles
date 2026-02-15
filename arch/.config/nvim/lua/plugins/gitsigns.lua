---@diagnostic disable: missing-fields
return {
  'lewis6991/gitsigns.nvim',
  enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  ---@module 'Gitsigns'
  opts = {
    numhl = true,
    signcolumn = false,
  },
  keys = {
    { '<leader>gb', '<CMD>:Gitsigns toggle_current_line_blame<CR>', desc = 'Git blame toggle', mode = { 'n' } },
    { '<leader>gp', '<CMD>:Gitsigns preview_hunk<CR>', desc = 'Git preview hunk', mode = { 'n' } },
  },
}

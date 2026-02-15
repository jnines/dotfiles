return {
  'hedyhli/outline.nvim',
  enabled = false,
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  opts = {
    preview_window = {
      auto_preview = true,
    },
  },
  keys = {
    { '<leader>o', '<CMD>Outline<CR>', desc = 'Toggle Outline', mode = { 'n' } },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = {
        statusline = { 'alpha', 'NvimTree' },
        winbar = {
          'help',
          'lir',
          'Outline',
          'snacks_layout_box',
        },
      },
    },
    sections = {
      lualine_c = {
        { 'filesize' },
        { 'filename', path = 3 },
      },
      lualine_x = {
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#9c814f' },
        },
        { 'encoding' },
        { 'fileformat' },
        { 'filetype' },
      },
    },
    extensions = { 'lazy' },
  },
}

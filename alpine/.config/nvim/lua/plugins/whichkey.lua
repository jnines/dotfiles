return {
  'folke/which-key.nvim',
  event = 'VeryLazy',

  opts = {
    replace = {
      key = {
        { '<tab>', 'TAB' },
        { '<space>', 'SPC' },
        { '<leader>', 'SPC' },
      },
    },
    sort = { 'alphanum' },
    spec = {
      {
        mode = { 'n', 'x' },
        { '<leader>b', group = 'Buffers' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Diagnostics' },
        { '<leader>f', group = 'File' },
        { '<leader>g', group = 'GoTo' },
        { '<leader>q', '<cmd>xa<CR><cmd>qa<CR>', desc = 'Quit' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Tabs' },
        { '<leader>x', group = 'Extras' },
      },
    },
  },
}

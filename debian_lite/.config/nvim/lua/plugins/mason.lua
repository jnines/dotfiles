return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
    keys = {
      { '<leader>M', '<CMD>Mason<CR>', desc = 'Mason', mode = { 'n' } },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    enabled = false,
    opts = {
      ensure_installed = {},
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'shellcheck',
        'shfmt',
      },
    },
  },
}

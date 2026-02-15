local M = {
  { 'xzbdmw/colorful-menu.nvim', enabled = true },
  {
    'saghen/blink.cmp',
    enabled = true,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        json = { 'jq' },
        yaml = { 'yamlfix' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        zsh = { 'shfmt' },
      },
    },
  },
  { 'lewis6991/gitsigns.nvim', enabled = true },
  { 'nvim-lualine/lualine.nvim', enabled = true },
  { 'neovim/nvim-lspconfig', enabled = true },
  {
    'williamboman/mason-lspconfig.nvim',
    enabled = true,
    opts = {
      ensure_installed = {
        'bashls',
        'jsonls',
        'yamlls',
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'shellcheck',
        'shfmt',
        'jsonlint',
        'yamllint',
      },
    },
  },
  { 'nvim-mini/mini.ai', enabled = true },
  { 'nvim-mini/mini.surround', enabled = true },
  { 'NvChad/nvim-colorizer.lua', enabled = true },
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        yaml = { 'yamllint' },
        json = { 'jsonlint' },
        bash = { 'shellcheck' },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        'json',
        'javascript',
        'yaml',
        'html',
        'markdown',
        'markdown_inline',
        'bash',
        'vim',
        'dockerfile',
        'gitignore',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    },
  },
  { 'christoomey/vim-tmux-navigator', enabled = true },
  { 'natecraddock/workspaces.nvim', enabled = true },
}

return M

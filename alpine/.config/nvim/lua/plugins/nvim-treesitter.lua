---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'tree-sitter/tree-sitter-regex',
    'nvim-treesitter/nvim-treesitter-context',
  },
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    ensure_installed = {
      'json',
      'yaml',
      'bash',
      'vim',
      'dockerfile',
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
  keys = {
    {
      '<leader>gc',
      function()
        require('treesitter-context').go_to_context()
      end,
      desc = 'GoTo context',
      mode = { 'n' },
    },
  },
}

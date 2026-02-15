return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  opts = {},
  vim.diagnostic.config({ virtual_text = false }), -- Disable default virtual text
}

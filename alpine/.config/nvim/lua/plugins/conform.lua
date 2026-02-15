return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  ---@module "conform"
  opts = {
    formatters_by_ft = {
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },
    },

    format_on_save = function(bufnr)
      if vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_format = 'fallback' }
    end,

    formatters = {
      shfmt = {
        args = { '-bn' },
      },
    },
  },
  keys = {
    {
      '<leader>,',
      function()
        require('conform').format({ timeout_ms = 1000, lsp_fallback = true, async = false })
      end,
      desc = 'Format file',
      mode = { 'n' },
    },
  },
}

return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    linters_by_ft = {
      bash = { 'shellcheck' },
    },
  },

  config = function(_, opts)
    local lint = require('lint')
    lint.linters_by_ft = opts.linters_by_ft
    lint.linters.luacheck.args = opts.luacheck_args

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        return require('lint').try_lint()
      end,
    })
  end,
  keys = {
    {
      '<leader>.',
      function()
        return require('lint').try_lint()
      end,
      desc = 'Lint current file',
      mode = { 'n' },
    },
  },
}

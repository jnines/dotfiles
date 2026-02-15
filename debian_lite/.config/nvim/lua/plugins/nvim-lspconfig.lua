return {
  'neovim/nvim-lspconfig',
  enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'saghen/blink.cmp',
    'b0o/schemastore.nvim',
  },

  init = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = '󰋼 ',
          [vim.diagnostic.severity.HINT] = '󰌵 ',
        },
      },
    })
  end,

  config = function()
    local blink = require('blink.cmp')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities())
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local profile = require('util.profiles').lsp_spec()
    local servers = require('specs.lsp_servers')[profile]

    for name, cfg in pairs(servers) do
      cfg.capabilities = vim.tbl_deep_extend('force', {}, capabilities, cfg.capabilities or {})
      vim.lsp.config(name, cfg)
      vim.lsp.enable(name)
    end
  end,
}

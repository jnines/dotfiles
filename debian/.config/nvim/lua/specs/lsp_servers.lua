local M = {}
M.core = {}
M.lite = {
  bashls = {},

  jsonls = {
    settings = {
      json = {
        schemas = function()
          require('schemastore').json.schemas()
        end,
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = false, url = '' },
        schemas = function()
          require('schemastore').yaml.schemas()
        end,
      },
    },
  },
}
M.full = {
  bashls = {},
  html = {},
  ts_ls = {},
  cssls = {},
  tailwindcss = {},
  graphql = {},
  emmet_ls = {},
  pyright = {},

  jsonls = {
    settings = {
      json = {
        schemas = function()
          require('schemastore').json.schemas()
        end,
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = false, url = '' },
        schemas = function()
          require('schemastore').yaml.schemas()
        end,
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
        completion = { callSnipper = 'Replace' },
      },
    },
  },

  marksman = {},

  gopls = {
    settings = {
      gopls = {
        usePlaceholders = false,
        analyses = { unusedparams = true },
      },
    },
  },

  qmlls = { cmd = { 'qmlls6' } },
}
return M

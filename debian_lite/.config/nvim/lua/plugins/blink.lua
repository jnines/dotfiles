return {
  'saghen/blink.cmp',
  enabled = false,
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'L3MON4D3/LuaSnip', version = 'v2.*', run = 'make install_jsregexp' },
    { 'xzbdmw/colorful-menu.nvim', event = { 'CmdlineEnter', 'InsertEnter' }, opts = {} },
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    enabled = function()
      local ft = vim.bo[0].filetype
      if ft == 'TelescopePrompt' or ft == 'minifiles' or ft == 'snacks_picker_input' then
        return false
      end
      return vim.g.blinktoggle
    end,
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        snippets = {
          min_keyword_length = 2,
          score_offset = 4,
        },
        lsp = {
          score_offset = 3,
        },
        path = {
          min_keyword_length = 3,
          score_offset = 2,
        },
        buffer = {
          min_keyword_length = 3,
          score_offset = 1,
        },
      },
    },
    completion = {
      list = {
        max_items = 10,
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
          auto_insert = function(ctx)
            return ctx.mode == 'cmdline'
          end,
        },
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        auto_show = true,
        border = 'rounded',
        winhighlight = 'Normal:Normal,FloatBorder:None,CursorLine:BlinkCmpMenuSelection,Search:None',
        draw = {
          padding = 2,
          gap = 5,
          columns = { { 'label' }, { 'kind_icon', gap = 2, 'kind' } },
          components = {
            label = {
              text = function(ctx)
                return require('colorful-menu').blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require('colorful-menu').blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        update_delay_ms = 50,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:None,EndOfBuffer:BlinkCmpDoc',
        },
      },
      accept = { auto_brackets = { enabled = true } },
    },
    fuzzy = {
      max_typos = function()
        return 0
      end,
    },

    keymap = {
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['Down'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['Up'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-e>'] = { 'cancel' },
    },
    cmdline = {
      completion = {
        menu = { auto_show = true },
      },
      keymap = {
        ['<cr>'] = {
          function(cmp)
            return cmp.accept({
              callback = function()
                vim.api.nvim_feedkeys('\n', 'n', true)
              end,
            })
          end,
          'fallback',
        },
        ['<Tab>'] = { 'select_next' },
        ['<S-Tab>'] = { 'select_prev' },
        ['<C-e>'] = { 'cancel' },
      },
    },
    appearance = {
      kind_icons = {
        Text = '󰉿',
        Method = '󰆧',
        Function = '󰊕',
        Constructor = '',
        Field = '󰜢',
        Variable = '󰀫',
        Class = '󰠱',
        Interface = '',
        Module = '',
        Property = '󰜢',
        Unit = '󰑭',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '󰈇',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '󰙅',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '󰬁',
      },
    },
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
        winhighlight = 'Normal:Normal,FloatBorder:None',
      },
    },
  },
}

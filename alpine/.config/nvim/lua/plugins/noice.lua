---@diagnostic disable: missing-fields
return {
  {
    'folke/noice.nvim',
    enabled = false,
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      --'rcarriga/nvim-notify' below
    },
    opts = {

      lsp = {
        progress = { enabled = false },
        -- use Treesitter
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      render = 'compact',
      stages = 'static',
      fps = 1,
    },
  },
}

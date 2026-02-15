return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_better_performance = true
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_show_eob = 0
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_cursor_line_contrast = 'higher'
    vim.cmd('colorscheme gruvbox-material')
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#8c8c8c' })
    vim.api.nvim_set_hl(0, 'SpellBad', { underline = true, sp = 'DarkYellow' })
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NonText', { fg = '#6b625d' })
  end,
}

return {
  'catgoose/nvim-colorizer.lua',
  enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    user_default_options = {
      suppress_deprecation = true,
    },
  },
}

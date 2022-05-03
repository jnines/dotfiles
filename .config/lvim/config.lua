-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "gruvbox"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-z>"] = ":wq<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q!<cr>"
lvim.keys.normal_mode["Y"] = "Yg_"

lvim.keys.insert_mode["<C-s>"] = "<escape>:w<cr>"
lvim.keys.insert_mode["<C-z>"] = "<escape>:wq<cr>"
lvim.keys.insert_mode[","] = ",<c-g>u"
lvim.keys.insert_mode["."] = ".<c-g>u"
lvim.keys.insert_mode["!"] = "!<c-g>u"
lvim.keys.insert_mode["?"] = "?<c-g>u"
lvim.keys.insert_mode["{"] = "{<c-g>u"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  local actions = require ("telescope.actions")
  lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<cr>", "Minimap" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.autopairs.active = true

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ensure_installed = { "json", "css", "javascript", "bash", "typescript", "vim", "php", "html", "yaml", "python", "perl" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
lvim.lsp.diagnostics.virtual_text = false
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- set a formatter if you want to override the default lsp one (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  { exe = "prettier",
    args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  { exe = "shfmt"},
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "eslint_d" },
  { exe = "shellcheck" },
  { exe = "vale" },
  { exe = "flake8" },
  { exe = "luacheck" },
}

-- Additional Plugins
lvim.plugins = {
    {
      'wfxr/minimap.vim',
       run = "cargo install --locked code-minimap",
       -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
       config = function ()
        vim.cmd ("let g:minimap_width = 15")
        vim.cmd ("let g:minimap_auto_start = 0")
        vim.cmd ("let g:minimap_auto_start_win_enter = 1")
        vim.cmd ("let g:minimap_highlight_search = 1")
        vim.cmd ("let g:minimap_highlight_range = 3")
        vim.cmd ("let g:minimap_git_colors = 1")
      end,
    },
    {
      "nacro90/numb.nvim",
       event = "BufRead",
       config = function()
       require("numb").setup {
         show_numbers = true, -- Enable 'number' for the window while peeking
         show_cursorline = true, -- Enable 'cursorline' for the window while peeking
       }
       end,
    },
    {
     "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("spectre").setup()
      end,
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    { "tpope/vim-repeat" },
    { "gruvbox-community/gruvbox" },
}

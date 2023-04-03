lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "gruvbox-material"

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
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<cr>", "Minimap" }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "php",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
lvim.lsp.diagnostics.virtual_text = true
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  { exe = "prettier",
    args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  { exe = "shfmt"},
}

-- -- set additional linters
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
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "tpope/vim-repeat" },
  { "sainnhe/gruvbox-material" }
}

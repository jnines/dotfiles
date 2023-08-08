lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "gruvbox-material"
lvim.hlsearch = false

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

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
lvim.builtin.which_key.mappings["m"] = { "<cmd>MinimapToggle<cr>", "Minimap" }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
vim.diagnostic.config({ virtual_text = true})
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
  { exe = "eslint" },
  { exe = "shellcheck" },
  { exe = "vale" },
  { exe = "flake8" },
  { exe = "luacheck" },
}

-- Additional Plugins
lvim.plugins = {
  {
    'wfxr/minimap.vim',
     build = "cargo install --locked code-minimap",
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

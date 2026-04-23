local o = vim.opt

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.scrolloff = 8
o.updatetime = 300
o.ttimeoutlen = 50
o.timeoutlen = 300
o.timeout = true
o.hidden = true
o.wrap = false
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.signcolumn = 'yes'
o.backspace = 'indent,eol,start'
o.splitright = true
o.splitbelow = true
o.showmatch = true
o.conceallevel = 0
o.cursorline = true
o.colorcolumn = '120'

o.swapfile = false
o.backup = false
o.undofile = true

o.termguicolors = true
o.incsearch = true
o.hlsearch = false
o.ignorecase = true
o.smartcase = true

o.relativenumber = true
o.number = true
o.numberwidth = 5
-- Effectively Relative/Sign/Number, but that normal combo is wonk
o.statuscolumn = table.concat({
  -- relnum bumped out so gutter doesn't move
  "%{v:virtnum < 1 ? printf('%3d', v:relnum) : '   '}",
  -- signs
  ' %s',
  -- absnum bumped out to 1000'th
  "%{v:virtnum < 1 ? printf('%3d', v:lnum) : '   '}",
  -- folds
  "%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? '' : '⏵') : ' '}",
})
o.laststatus = 3
o.winborder = 'rounded'

o.iskeyword:append('-')
o.spelllang = 'en_us'
o.spell = true

o.foldenable = true
o.foldlevel = 99
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.lsp.foldexpr()'

local has_native_clipboard = (vim.fn.executable('xclip') == 1 and vim.env.DISPLAY)
  or (vim.fn.executable('xsel') == 1 and vim.env.DISPLAY)
  or (vim.fn.executable('wl-copy') == 1 and vim.env.WAYLAND_DISPLAY)
if not has_native_clipboard then
  local _, osc52 = pcall(require, 'vim.ui.clipboard.osc52')
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = osc52.copy('+'),
      ['*'] = osc52.copy('*'),
    },
    paste = {
      ['+'] = osc52.paste('+'),
      ['*'] = osc52.paste('*'),
    },
  }
end

o.cmdheight = 0
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'msg',
      empty = 'cmd',
      bufwrite = 'msg',
      confirm = 'cmd',
      emsg = 'pager',
      echo = 'msg',
      echomsg = 'msg',
      echoerr = 'pager',
      completion = 'cmd',
      list_cmd = 'pager',
      lua_error = 'pager',
      lua_print = 'msg',
      progress = 'pager',
      rpc_error = 'pager',
      quickfix = 'msg',
      search_cmd = 'cmd',
      search_count = 'cmd',
      shell_cmd = 'pager',
      shell_err = 'pager',
      shell_out = 'pager',
      shell_ret = 'msg',
      undo = 'msg',
      verbose = 'pager',
      wildlist = 'cmd',
      wmsg = 'msg',
      typed_cmd = 'cmd',
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.5,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})

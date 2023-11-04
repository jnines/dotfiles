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
o.mouse = "a"
o.clipboard = "unnamedplus"
o.signcolumn = "yes"
o.backspace = "indent,eol,start"
o.splitright = true
o.splitbelow = true
o.showmatch = true

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
o.numberwidth = 3
-- Effectively Relative/Sign/Number, but that normal combo is wonk
o.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s%l"
o.laststatus = 3

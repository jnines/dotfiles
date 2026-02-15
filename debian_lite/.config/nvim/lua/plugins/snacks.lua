---@diagnostic disable: duplicate-set-field
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = {
      replace_netrw = true,
      enabled = true,
      hidden = true,
      ignored = true,
    },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
      top_down = false,
    },
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
      exclude = { '.git', 'node_modules' },
      layout = 'telescope',
      matcher = {
        frecency = true,
      },
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 35,
            },
          },
        },
      },
      win = {
        list = {
          keys = {
            ['<c-q>'] = { 'close', mode = 'n' },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    -- stylua: ignore start
    { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
    { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>N",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "<leader>e",       function() Snacks.explorer() end,               desc = "File Explorer" },
    {
      "<leader>bb",
      function()
        Snacks.picker.buffers({
          focus = 'list',
          win = { input = { keys = { ['d'] = 'bufdelete' },
          },
            list = { keys = { ['d'] = 'bufdelete' } },
            },
        })
      end,
      desc = "Buffers"
    },
    -- find
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>fG", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- Git
    { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    -- Search
    { '<leader>s"', function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa", function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>dd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>db", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>fk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>u",  function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>xC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>gd", function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "<leader>gD", function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "<leader>gr", function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "<leader>gI", function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "<leader>gy", function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- Other
    { "<leader>\\", function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
    { "<leader>N",  function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
    { "<leader>bd", function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>rf", function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
    { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>xn", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
    { "<leader>i",  function() Snacks.picker.icons() end,                                   desc = "Icons" },
  },
  -- stylua: ignore end
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has('nvim-0.11') == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>su')
        Snacks.toggle.diagnostics():map('<leader>du')
        Snacks.toggle
          .option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map('<leader>xu')
        Snacks.toggle.treesitter():map('<leader>xT')
        Snacks.toggle.inlay_hints():map('<leader>xh')
        Snacks.toggle.dim():map('<leader>xd')
        Snacks.toggle
          .new({
            id = 'blink_cmp_toggle',
            name = 'Blink.cmp',
            get = function()
              return vim.g.blinktoggle
            end,
            set = function()
              vim.g.blinktoggle = not vim.g.blinktoggle
            end,
          })
          :map('<leader>xc')
        Snacks.toggle
          .new({
            id = 'conform_auto_format_toggle',
            name = 'Autoformatting',
            get = function()
              return not vim.b.disable_autoformat
            end,
            set = function()
              vim.b.disable_autoformat = not vim.b.disable_autoformat
            end,
          })
          :map('<leader>F')
      end,
    })
    -- Kill snacks explorer when quitting out
    vim.api.nvim_create_autocmd('QuitPre', {
      callback = function()
        local snacks_windows = {}
        local floating_windows = {}
        local windows = vim.api.nvim_list_wins()
        for _, w in ipairs(windows) do
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(w) })
          if filetype:match('snacks_') ~= nil then
            table.insert(snacks_windows, w)
          elseif vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_windows, w)
          end
        end
        if 1 == #windows - #floating_windows - #snacks_windows then
          -- Should quit, so we close all Snacks windows.
          for _, w in ipairs(snacks_windows) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end,
    })
  end,
}

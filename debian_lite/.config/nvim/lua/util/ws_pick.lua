local M = {}
function M.pick()
  local workspaces = require('workspaces')

  local function ws_exists(path)
    path = vim.fs.normalize(path)
    for _, ws in ipairs(workspaces.get()) do
      if vim.fs.normalize(ws.path) == path then
        return true
      end
    end
    return false
  end

  local function build_items()
    local items = {}
    local longest_name = 0

    for i, ws in ipairs(workspaces.get()) do
      items[#items + 1] = {
        idx = i,
        score = i,
        name = ws.name,
        text = ws.path,
        _path = ws.path,
      }
      longest_name = math.max(longest_name, #ws.name)
    end

    return items, longest_name + 2
  end

  local function ws_picker()
    local items, longest_name = build_items()

    Snacks.picker({
      items = items,
      focus = 'list',
      layout = {
        reverse = true,
        layout = {
          box = 'horizontal',
          backdrop = false,
          width = 0.6,
          height = 0.7,
          border = 'none',
          {
            box = 'vertical',
            { win = 'list', title = 'Workspaces', title_pos = 'center', border = true },
            { win = 'input', height = 1, border = true, title = '{title} {live} {flags}', title_pos = 'center' },
          },
        },
      },
      format = function(item)
        return {
          { ('%-' .. longest_name .. 's'):format(item.name), 'SnacksPickerLabel' },
          { item.text, 'SnacksPickerComment' },
        }
      end,
      confirm = function(picker, item)
        picker:close()
        vim.cmd(('WorkspacesOpen %s'):format(item.name))
      end,
      actions = {
        add = function(picker)
          local cwd = vim.fn.getcwd()
          local name = vim.fn.fnamemodify(cwd, ':t')

          if ws_exists(cwd) then
            vim.notify('Workspace already exists', vim.log.levels.WARN, { title = 'Workspaces' })
            return
          end

          workspaces.add(cwd, name)
          picker:close()
          vim.schedule(ws_picker)
        end,

        delete = function(picker)
          local item = picker.list and picker.list:current()
          if not item then
            return
          end
          workspaces.remove(item.name)
          picker:close()
          vim.schedule(ws_picker)
        end,
      },
      win = {
        list = { keys = { ['A'] = 'add', ['D'] = 'delete' } },
      },
    })
  end
  ws_picker()
end
return M

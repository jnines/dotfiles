return {
  'natecraddock/workspaces.nvim',
  enabled = false,

  opts = function()
    return {
      path = vim.fs.normalize('~/.local/workspaces'),
      hooks = {
        open = function()
          local workspaces = require('workspaces')
          vim.notify(
            (' Entered Project: %s\n %s'):format(workspaces.name(), workspaces.path()),
            vim.log.levels.INFO,
            { title = 'Workspace' }
          )
        end,
      },
    }
  end,

  keys = {
    {
      '<leader>w',
      function()
        require('util.ws_pick').pick()
      end,
      desc = 'Workspaces picker',
    },
  },
}

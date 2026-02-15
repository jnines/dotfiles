local M = {}

local function flag_exists(name)
  return vim.fn.filereadable(vim.fs.normalize('~/.config/nvim/.' .. name)) == 1
end

function M.get_lazy_spec_imports()
  local spec = {
    { import = 'plugins' },
  }

  local profiles = {
    -- 'core',  default /plugins
    'lite',
    'full',
  }

  for _, s in ipairs(profiles) do
    if flag_exists(s) then
      table.insert(spec, { import = 'specs.' .. s })
    end
  end
  return spec
end

function M.lsp_spec()
  if flag_exists('full') then
    return 'full'
  elseif flag_exists('lite') then
    return 'lite'
  else
    return 'core'
  end
end
return M

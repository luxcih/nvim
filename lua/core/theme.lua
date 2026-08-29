local M = {}

local config = require("config.theme")
local statefile = vim.fs.joinpath(vim.fn.stdpath("state"), "theme")

-- Discovery

function M.available()
  return vim.fn.getcompletion("", "color")
end

function M.exists(theme)
  return type(theme) == "string"
    and theme ~= ""
    and vim.tbl_contains(M.available(), theme)
end

-- Application

function M.apply(theme)
  if not M.exists(theme) then
    return false
  end

  return pcall(vim.cmd.colorscheme, theme)
end

-- Persistence

function M.read()
  local ok, lines = pcall(vim.fn.readfile, statefile)

  if not ok then
    return nil
  end

  local theme = lines[1]

  if not theme or theme == "" then
    return nil
  end

  return theme
end

function M.write(theme)
  vim.fn.writefile({ theme }, statefile)
end

-- Public operations

function M.set(theme)
  if not M.apply(theme) then
    vim.notify("Invalid theme: " .. tostring(theme), vim.log.levels.WARN)
    return false
  end

  M.write(theme)
  return true
end

function M.load()
  local saved = M.read()

  if saved and M.apply(saved) then
    return true
  end

  local themes = {}

  if config.default then
    table.insert(themes, config.default)
  end

  vim.list_extend(themes, config.fallbacks or {})

  for _, theme in ipairs(themes) do
    if M.apply(theme) then
      return true
    end
  end

  vim.notify("Failed to load a theme.", vim.log.levels.WARN)
  return false
end

function M.pick()
  local MiniPick = require("mini.pick")

  MiniPick.start({
    source = {
      name = "Themes",
      items = M.available(),
      choose = M.set,
    },
  })
end

function M.init()
  local saved = M.read()

  if saved and M.apply(saved) then
    return true
  end

  local autocmd = require("core.autocmd")

  autocmd.create("VimEnter", {
    once = true,
    callback = M.load,
  })

  return false
end

return M

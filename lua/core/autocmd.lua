local M = {}

--- Create or replace an autocmd group.
---@param name string
---@param opts? vim.api.keyset.create_augroup
---@return integer
function M.group(name, opts)
  return vim.api.nvim_create_augroup(name, opts or {})
end

--- Create an autocommand.
---@param event string|string[]
---@param opts vim.api.keyset.create_autocmd
---@return integer
function M.create(event, opts)
  return vim.api.nvim_create_autocmd(event, opts)
end

--- Delete an autocommand.
---@param id integer
function M.delete(id)
  vim.api.nvim_del_autocmd(id)
end

--- Clear autocommands matching the given options.
---@param opts vim.api.keyset.clear_autocmds
function M.clear(opts)
  vim.api.nvim_clear_autocmds(opts)
end

return M

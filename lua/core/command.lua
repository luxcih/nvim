local M = {}

--- Create a user command.
---@param name string
---@param command string|function
---@param opts? vim.api.keyset.user_command
function M.create(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts or {})
end

--- Delete a user command.
---@param name string
function M.delete(name)
  vim.api.nvim_del_user_command(name)
end

return M

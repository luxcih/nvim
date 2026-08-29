local M = {}

--- Set a keymap.
---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
function M.set(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts or {})
end

--- Delete a keymap.
---@param mode string|string[]
---@param lhs string
---@param opts? vim.keymap.del.Opts
function M.delete(mode, lhs, opts)
  vim.keymap.del(mode, lhs, opts or {})
end

return M

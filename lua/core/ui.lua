local M = {}

M.defaults = {
  width = 0.7,
  height = 0.7,
}

--- Resolve a dimension into cells.
---
--- Values from 0 to 1 are treated as ratios.
--- Larger values are treated as absolute dimensions.
---@param value number
---@param total integer
---@return integer
function M.dimension(value, total)
  if value > 0 and value <= 1 then
    return math.floor(total * value)
  end

  return math.floor(value)
end

--- Return the current editor dimensions.
---@return integer width
---@return integer height
function M.editor_size()
  return vim.o.columns, vim.o.lines
end

--- Resolve window dimensions.
---@param opts? { width?: number, height?: number }
---@return integer width
---@return integer height
function M.size(opts)
  opts = opts or {}

  local columns, lines = M.editor_size()

  return M.dimension(opts.width or M.defaults.width, columns),
    M.dimension(opts.height or M.defaults.height, lines)
end

--- Calculate the position required to center a rectangle.
---@param width integer
---@param height integer
---@return integer row
---@return integer col
function M.center(width, height)
  local columns, lines = M.editor_size()

  return math.floor((lines - height) / 2),
    math.floor((columns - width) / 2)
end

--- Create a floating window configuration.
---
--- Width and height may be ratios or absolute dimensions.
---@param opts? table
---@return table
function M.float(opts)
  opts = opts or {}

  local width, height = M.size(opts)

  return vim.tbl_extend("force", {}, opts, {
    width = width,
    height = height,
  })
end

--- Create a centered floating window configuration.
---
--- Width and height may be ratios or absolute dimensions.
---@param opts? table
---@return table
function M.centered_float(opts)
  opts = opts or {}

  local width, height = M.size(opts)
  local row, col = M.center(width, height)

  return vim.tbl_extend("force", {}, opts, {
    relative = opts.relative or "editor",
    anchor = opts.anchor or "NW",
    width = width,
    height = height,
    row = row,
    col = col,
  })
end

return M

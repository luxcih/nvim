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

--- Calculate the position of a rectangle inside the editor.
---@param position string
---@param width integer
---@param height integer
---@param opts? { margin?: number, row_offset?: number, col_offset?: number }
---@return integer row
---@return integer col
function M.position(position, width, height, opts)
  opts = opts or {}

  local columns, lines = M.editor_size()
  local margin = opts.margin or 0

  local positions = {
    center = function()
      return math.floor((lines - height) / 2),
        math.floor((columns - width) / 2)
    end,
    top = function()
      return margin, math.floor((columns - width) / 2)
    end,
    bottom = function()
      return lines - height - margin, math.floor((columns - width) / 2)
    end,
    left = function()
      return math.floor((lines - height) / 2), margin
    end,
    right = function()
      return math.floor((lines - height) / 2), columns - width - margin
    end,
    ["top-left"] = function()
      return margin, margin
    end,
    ["top-right"] = function()
      return margin, columns - width - margin
    end,
    ["bottom-left"] = function()
      return lines - height - margin, margin
    end,
    ["bottom-right"] = function()
      return lines - height - margin, columns - width - margin
    end,
  }

  local calculate = positions[position or "center"]

  if not calculate then
    error("Invalid UI position: " .. tostring(position))
  end

  local row, col = calculate()

  return row + (opts.row_offset or 0),
    col + (opts.col_offset or 0)
end

--- Calculate the position required to center a rectangle.
---@param width integer
---@param height integer
---@return integer row
---@return integer col
function M.center(width, height)
  return M.position("center", width, height)
end

--- Create a floating window configuration.
---
--- Width and height may be ratios or absolute dimensions.
--- Set position to place the window automatically.
---@param opts? table
---@return table
function M.float(opts)
  opts = opts or {}

  local width, height = M.size(opts)
  local position = opts.position

  local config = vim.tbl_extend("force", {}, opts, {
    width = width,
    height = height,
  })

  config.position = nil
  config.margin = nil
  config.row_offset = nil
  config.col_offset = nil

  if position then
    local row, col = M.position(position, width, height, opts)

    config.row = opts.row or row
    config.col = opts.col or col
  end

  return config
end

--- Create a centered floating window configuration.
---@param opts? table
---@return table
function M.centered_float(opts)
  opts = opts or {}

  return M.float(vim.tbl_extend("force", {}, opts, {
    relative = opts.relative or "editor",
    anchor = opts.anchor or "NW",
    position = "center",
  }))
end

return M

local keymap = require("core.keymap")

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  severity_sort = true,
})

keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })

keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous Diagnostic" })

keymap.set("n", "<Leader>e", vim.diagnostic.open_float, {
  desc = "Line Diagnostics",
})

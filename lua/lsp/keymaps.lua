local autocmd = require("core.autocmd")
local keymap = require("core.keymap")
local extra = require("mini.extra")

local group = autocmd.group("Lsp", { clear = true })

local function map(buf, lhs, rhs, desc)
  keymap.set("n", lhs, rhs, {
    buffer = buf,
    desc = desc,
  })
end

autocmd.create("LspAttach", {
  group = group,
  callback = function(event)
    local buf = event.buf

    map(buf, "gd", vim.lsp.buf.definition, "Goto Definition")
    map(buf, "gD", vim.lsp.buf.declaration, "Goto Declaration")
    map(buf, "gi", vim.lsp.buf.implementation, "Goto Implementation")

    map(buf, "gr", function()
      extra.pickers.lsp({ scope = "references" })
    end, "References")

    map(buf, "K", vim.lsp.buf.hover, "Hover")
    map(buf, "gK", vim.lsp.buf.signature_help, "Signature Help")

    map(buf, "<Leader>rn", vim.lsp.buf.rename, "Rename")
    map(buf, "<Leader>ca", vim.lsp.buf.code_action, "Code Action")
  end,
})

local autocmd = require("core.autocmd")
local keymap = require("core.keymap")
local extra = require("mini.extra")

local group = autocmd.group("Lsp", { clear = true })

autocmd.create("LspAttach", {
  group = group,
  callback = function(event)
    local opts = { buffer = event.buf }

    keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {
      desc = "Goto Definition",
    }))
    keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, {
      desc = "Goto Declaration",
    }))
    keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, {
      desc = "Goto Implementation",
    }))
    keymap.set("n", "gr", function()
      extra.pickers.lsp({ scope = "references" })
    end, vim.tbl_extend("force", opts, {
      desc = "References",
    }))
    keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, {
      desc = "Hover",
    }))
    keymap.set("n", "gK", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, {
      desc = "Signature Help",
    }))
    keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, {
      desc = "Rename",
    }))
    keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {
      desc = "Code Action",
    }))
  end,
})

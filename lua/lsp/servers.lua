vim.lsp.config("*", {
  capabilities = require("lsp.capabilities").get(),
})

vim.lsp.enable({
  "clangd",
  "cssls",
  "emmet_language_server",
  "eslint",
  "html",
  "lua_ls",
  "pyright",
  "ruff",
  "ts_ls",
  "zls",
})

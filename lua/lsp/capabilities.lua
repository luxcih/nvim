local M = {}

function M.get()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local completion = capabilities.textDocument.completion.completionItem

  completion.snippetSupport = true
  completion.preselectSupport = true
  completion.insertReplaceSupport = true
  completion.labelDetailsSupport = true
  completion.documentationFormat = { "markdown", "plaintext" }
  completion.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

return M

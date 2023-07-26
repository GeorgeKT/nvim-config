local lsp = require 'lspconfig'
lsp.rust_analyzer.setup{
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      procMacro = { enable = true, attributes = { enable = true } }
    }
  }
}

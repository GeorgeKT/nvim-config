local lsp = require'lspconfig'

lsp.rust_analyzer.setup {                
    settings = {
        procMacro = { enable = true },
    }
}

local lsp = require 'lspconfig'
lsp.rust_analyzer.setup{
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      procMacro = { enable = true, attributes = { enable = true } },
      cargo = {features = {"usmdb", "power_service", "lcd_service", "mdns_service", "extension_service", "license-eeprom", "groups", "deploy_adapter", "interface-service", "oem_dnb_service", "milan"} }
    }
  }
}

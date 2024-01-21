require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml", "c", "cpp" },
  auto_install = true,
  highlight = {
    enable = true,
    disable = {"menhir"},
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

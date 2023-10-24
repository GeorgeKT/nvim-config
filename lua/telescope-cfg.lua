-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser<CR>",
  { }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>fc",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { }
)

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files no_ignore=true hidden=true<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fu', ':Telescope lsp_references<CR>', {})

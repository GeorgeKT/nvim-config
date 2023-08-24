vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]

local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	-- disable lsp watcher. Too slow on linux
    wf._watchfunc = function()
	    return function() end
    end
end

local rt = require("rust-tools")

rt.setup({
  tools = {
    autosethints = true,
    inlay_hints = {
        auto = true,
        show_parameter_hints = true,
    },
    hover_actions = {
        auto_focus = true
    }
  },
  server = {
    on_attach = function(c, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require('null-ls').setup({
  sources = {
    require('null-ls').builtins.formatting.prettier,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.code_actions.gitsigns,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()')
    end
  end,
})

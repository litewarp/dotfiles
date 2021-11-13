require('null-ls').config({
  sources = {
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.code_actions.gitsigns,
  },
})

require('lspconfig')['null-ls'].setup({
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()')
    end
  end,
})

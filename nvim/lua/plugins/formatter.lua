require('formatter').setup({

  filetype = {
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
    typescript = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
    html = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
    css = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path',
            '~/.config/nvim/.stylua.toml',
            '-',
          },
          stdin = true,
        }
      end,
    },
  },
})

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.rs,*.lua,*.html,*.css FormatWrite
augroup END
]],
  true
)
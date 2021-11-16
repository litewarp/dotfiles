-- Setup global configuration. More on configuration below.
local cmp = require('cmp')

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
      == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), 'n', true)
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({

  formatting = {
    format = require('lspkind').cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = '[LSP]',
        buffer = '[Buffer]',
        nvim_lua = '[Lua]',
        ultisnips = '[UltiSnips]',
        treesitter = '[treesitter]',
        look = '[Look]',
        path = '[Path]',
        spell = '[Spell]',
        calc = '[Calc]',
        emoji = '[Emoji]',
        neorg = '[Neorg]',
        -- cmp_tabnine = '[TabNine]',
      },
    }),
  },

  mapping = {
    ['<C-j>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end,
    }),
    ['<C-k>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        else
          fallback()
        end
      end,
    }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'luasnip', max_item_count = 5 },
    { name = 'nvim_lua', max_item_count = 5 },
    { name = 'buffer', keyword_length = 5, max_item_count = 5 },
    { name = 'path' },
    { name = 'treesitter', max_item_count = 10 },
    { name = 'calc' },
    { name = 'spell' },
    -- { name = 'cmp_tabnine', max_item_count = 3 },
  },

  completion = { completeopt = 'menu,menuone,noinsert', keyword_length = 1 },
  experimental = { native_menu = false, ghost_text = false },
})

-- local tabnine = require("cmp_tabnine.config")

-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 3,
--   sort = true,
--   show_prediction_strength = true,
-- })
cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol', max_item_count = 8, keyword_length = 3 },
  }, {
    { name = 'buffer', max_item_count = 5, keyword_length = 5 },
  }),
})

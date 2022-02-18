 local cmp = require'cmp'
 local lspkind = require'lspkind'

 cmp.setup({
    snippet = {
       -- REQUIRED - you must specify a snippet engine
       expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
       end,
    },
    mapping = {
       ["<C-d>"] = cmp.mapping.scroll_docs(-4),
       ["<C-f>"] = cmp.mapping.scroll_docs(4),
       ["<C-e>"] = cmp.mapping.close(),
       ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm {
             behavior = cmp.ConfirmBehavior.Insert,
             select = true,
          },
          { "i", "c" }
       ),
       ["<C-space>"] = cmp.mapping {
          i = cmp.mapping.complete(),
          c = function(
             _ --[[fallback]]
             )
             if cmp.visible() then
                if not cmp.confirm { select = true } then
                   return
                end
             else
                cmp.complete()
             end
          end,
       },
       -- ["<c-q>"] = cmp.mapping.confirm {
       --    behavior = cmp.ConfirmBehavior.Replace,
       --    select = true,
       -- },
    },
    sources = cmp.config.sources({
       { name = "nvim_lua" },
       { name = "nvim_lsp" },
       { name = "path" },
       { name = "buffer", keyword_length = 5 }
    }),

    formatting = {
       format = lspkind.cmp_format {
          with_text = true,
          menu = {
             buffer = "[buf]",
             nvim_lsp = "[LSP]",
             nvim_lua = "[api]",
             path = "[path]",
          },
       }
    }
 })

 -- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
 -- cmp.setup.cmdline('/', {
 --    sources = {
 --       { name = 'buffer' }
 --    }
 -- })

 -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
 -- cmp.setup.cmdline(':', {
 --    sources = cmp.config.sources({
 --       { name = 'path' }
 --    }, {
 --       { name = 'cmdline' }
 --    })
 -- })

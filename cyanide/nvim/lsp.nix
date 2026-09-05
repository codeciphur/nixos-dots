# lsp.nix
{ pkgs }:
let
  lsp = {
    extraPackages = with pkgs; [
      nil                   # Nix LSP
      lua-language-server  # Lua LSP
      basedpyright         # Python LSP
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      nvim-autopairs        # Auto-inserts parentheses on function completion
    ];

    initLua = ''
      -- Autocompletion Setup (nvim-cmp)
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Autopairs Setup & Integration with nvim-cmp
      local npairs = require('nvim-autopairs')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      npairs.setup({})
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      -- LSP Server Configurations (Neovim 0.11+ API)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.lsp.config('nil_ls', {})
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
      vim.lsp.config('basedpyright', {})

      vim.lsp.enable('nil_ls')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('basedpyright')

      -- Define Diagnostic Signs & Inline Error Lens
      local signs = {
        Error = " ",
        Warn  = " ",
        Info  = " ",
        Hint  = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          format = function(diagnostic)
            local severity_name = vim.diagnostic.severity[diagnostic.severity]
            severity_name = severity_name:sub(1, 1):upper() .. severity_name:sub(2):lower()
            local icon = signs[severity_name] or ""
            return string.format("%s %s", icon, diagnostic.message)
          end,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Global LSP Keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })
    '';
  };
in
lsp

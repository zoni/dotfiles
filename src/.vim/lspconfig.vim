lua << EOF
-- Setup nvim-cmp for autocompletion
local cmp = require('cmp')

cmp.setup({
  completion = {
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
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
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup cmdline completion for search (/, ?)
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Setup cmdline completion for commands (:)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Language server configurations
local servers = {
    ansiblels = {
        --filetypes = { "yaml.ansible" },
        single_file_support = false
    },
    elixirls = {
        cmd = { "elixir-ls" },
    },
    -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
    gopls = {},
    pyright = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                rustfmt = {
                    extraArgs = { "+nightly" },
                },
            },
        },
    },
    terraformls = {},
    ts_ls = {},
    yamlls = {},
}

-- Configure keybindings when language server attaches to buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>mD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>ma', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>me', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<leader>mf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  buf_set_keymap('n', '<leader>mr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>mwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>mwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>mwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Enable each language server
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for lsp, config in pairs(servers) do
  -- Available strategies for extend: "error": raise an error, "keep": use value
  -- from the leftmost map, "force": use value from the rightmost map
  local final_config = vim.tbl_extend('error', config, {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  })

  vim.lsp.config[lsp] = final_config
  vim.lsp.enable(lsp)
end

-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports
function go_organize_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end
EOF

augroup LanguageClientAU
    au!
    au BufWritePre *.ex,*.exs,*.go,*.py,*.rs,*.yml,*.yaml lua vim.lsp.buf.format()
    au BufWritePre *.go lua go_organize_imports()
    au BufWritePost *.go GoTest!
augroup END

-- Autocomplete
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason/LSP
require('mason').setup()

local install_lsp = false
if install_lsp then
    local function mason_install(packageName)
        vim.cmd("MasonInstall " .. packageName)
    end

    local ensure_installed_list = {
        'pyright',  -- Python
        'jdtls',    -- Java
        'marksman', -- Markup
        'yaml-language-server', -- YAML
        'typescript-language-server',   -- JS/TS
        'rust-analyzer', -- Rust
        'lua-language-server',  -- Lua
        'json-lsp', -- JSON
        'html-lsp', -- HTML
        'eslint-lsp',    -- ESLint
        'clangd',    -- C/C++
        'ltex-ls'   -- LaTeX
    }

    local function ensure_all_installed(install_list)
        for i, v in ipairs(install_list) do
            mason_install(v)
        end
    end

    ensure_all_installed(ensure_installed_list)
end

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.jdtls.setup {}
lspconfig.marksman.setup {}
lspconfig.yamlls.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {}
lspconfig.jsonls.setup {}
lspconfig.html.setup {}
lspconfig.eslint.setup {}
lspconfig.clangd.setup {}
lspconfig.ltex.setup {}

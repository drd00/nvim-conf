local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {{"nvim-telescope/telescope.nvim", tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "nvim-treesitter/nvim-treesitter",
    "rebelot/kanagawa.nvim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release
        version = "v2.*",
        -- install jsregexp (optional!)
        build = "make install_jsregexp"
    },
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "mfussenegger/nvim-jdtls",
}

require("lazy").setup(plugins, opts)

-- telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fn', builtin.help_tags, {})

-- theme
vim.cmd("colorscheme kanagawa-wave")
require("drd00.settings")
require("drd00.autocmp_lsp")

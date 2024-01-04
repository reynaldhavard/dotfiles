local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

require "lspconfig".efm.setup {
    on_attach = require("lsp-format").on_attach,
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            bash = {
                require('efmls-configs.formatters.shfmt'),
            },
            cmake = {
                require('efmls-configs.formatters.gersemi'),
            },
            cpp = {
                require('efmls-configs.formatters.clang_format'),
            },
            css = {
                require('efmls-configs.formatters.prettier'),
            },
            html = {
                require('efmls-configs.formatters.prettier'),
            },
            json = {
                require('efmls-configs.formatters.prettier'),
            },
            markdown = {
                require('efmls-configs.formatters.prettier'),
            },
            lua = {
                require('efmls-configs.formatters.lua_format'),
            },
            python = {
                require('efmls-configs.formatters.black'),
            },
            sh = {
                require('efmls-configs.formatters.shfmt'),
            },
            sql = {
                require('efmls-configs.formatters.sql-formatter'),
            },
            yaml = {
                require('efmls-configs.formatters.prettier'),
            }
        }
    }
}

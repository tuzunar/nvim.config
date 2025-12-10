-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- 1. Prepare the capabilities for autocompletion (cmp)
-- We define this locally instead of patching a global deprecated object
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 2. Setup Mason handlers to apply these capabilities to every server
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            -- Register the server with the capabilities
            vim.lsp.config(server_name, {
                capabilities = capabilities,
            })
            vim.lsp.enable(server_name)
        end,
    }
})

-- 3. Your existing LspAttach autocmd (Keep this exactly as you had it)
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

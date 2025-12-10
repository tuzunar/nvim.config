require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            vim.lsp.config(server_name, {})
            vim.lsp.enable(server_name)
        end,
    }
})

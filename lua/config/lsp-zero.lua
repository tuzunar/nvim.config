-- Modern lsp-zero v4 setup (Safe for Neovim 0.11)
local lsp_zero = require('lsp-zero')

-- Attach LSP keybindings only when a server is active
local lsp_attach = function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end

-- Setup Mason to manage installation
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        -- This function is called for every installed server automatically
        function(server_name)
            vim.lsp.config(server_name, {
                on_attach = lsp_attach,
                -- This line connects the server to the autocomplete engine
                capabilities = lsp_zero.get_capabilities()
            })
            vim.lsp.enable(server_name)
        end,
    },
})

local null_ls = require("null-ls")


null_ls.setup({
    sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.formatting.goimports_reviser
    },
})

local lsp_formatting = function(bufnr)
    local clients = vim.lsp.buf_get_clients(bufnr)
    local has_null_ls_client = false
    for _, client in ipairs(clients) do
        if client.name == "null-ls" then
            has_null_ls_client = true
            break
        end
    end
    vim.lsp.buf.format({
        filter = function(client)
            if has_null_ls_client == true or client.name == "null-ls" then
                print("Formatting with null-ls")
                return client.name == "null-ls"
            else
                return client.name ~= "eslint_d" and client.name ~= "tsserver" and client.name ~= "null-ls"
            end
        end,
        bufnr = bufnr,
    })
end

vim.keymap.set("n", "<leader>f", lsp_formatting)

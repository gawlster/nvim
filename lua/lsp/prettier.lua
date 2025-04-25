local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}

local config = {
    filetypes = { "javascript", "typescript", "json", "markdown", "yaml", "html", "css", "javascriptreact", "typescriptreact" },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            javascript = { prettier },
            typescript = { prettier },
            json = { prettier },
            markdown = { prettier },
            yaml = { prettier },
            html = { prettier },
            css = { prettier },
            javascriptreact = { prettier },
            typescriptreact = { prettier }
        },
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
}

vim.lsp.start_client({
    name = "efm",
    cmd = { 'efm-langserver' },
    root_dir = vim.fn.getcwd(),
    settings = config.settings,
    init_options = config.init_options,
})

-- Attach the client to all relevant buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "json", "markdown", "yaml", "html", "css", "javascriptreact", "typescriptreact" },
    callback = function()
        vim.lsp.buf_attach_client(0, vim.lsp.get_active_clients()[1].id)
    end,
})

-- Enable format on save with autocommand
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.json", "*.md", "*.yaml", "*.html", "*.css", "*.jsx", "*.tsx" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

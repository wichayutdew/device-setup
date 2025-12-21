-- LSP, Mason, Treesitter, and Formatter Configuration
return function()
    ---------------------- Mason ---------------------
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
        ensure_installed = {
            "lua_ls",
            "stylua",
            "rust_analyzer",
            "markdownlint",
            "marksman",
            "jsonls",
            "jq",
            "cucumber_language_server",
            "reformat-gherkin",
        },
    })

    ---------------------- LSP Server Configuration ---------------------
    vim.lsp.enable({ "lua_ls", "rust_analyzer", "marksman", "jsonls", "cucumber_language_server" })

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        lua_ls = { capabilities = lsp_capabilities, filetypes = { "lua" } },
        rust_analyzer = { settings = { ["rust-analyzer"] = {} } },
        marksman = { capabilities = lsp_capabilities, filetypes = { "markdown" } },
        jsonls = { capabilities = lsp_capabilities, filetypes = { "json" } },
        cucumber_language_server = { capabilities = lsp_capabilities, filetypes = { "feature" } },
    }

    for server, config in pairs(servers) do
        vim.lsp.config(server, config)
    end

    ---------------------- Treesitter ---------------------
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "markdown", "json", "gherkin" },
        highlight = { enable = true },
    })

    ---------------------- Formatter ---------------------
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            rust = { "rustfmt" },
            markdown = { "markdownlint" },
            json = { "jq" },
            cucumber = { "reformat-gherkin" },
        },
    })

    ---------------------- Diagnostic Signs ---------------------
    local sign = function(opts)
        vim.fn.sign_define(opts.name, {
            texthl = opts.name,
            text = opts.text,
            numhl = "",
        })
    end
    sign({ name = "DiagnosticSignError", text = "✘" })
    sign({ name = "DiagnosticSignWarn", text = "▲" })
    sign({ name = "DiagnosticSignHint", text = "⚑" })
    sign({ name = "DiagnosticSignInfo", text = "»" })
    vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
            border = "rounded",
            source = true,
        },
    })
end

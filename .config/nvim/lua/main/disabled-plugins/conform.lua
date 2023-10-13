return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                -- javascript = { { "prettierd", "prettier" } },
                tex = { "latexindent" },
                yaml = { "prettier_d" },
                html = { "prettier_d" },
                css = { "prettier_d" },
                sh = { "shfmt" },
                javascript = { "prettier_d" },
                typescript = { "prettier_d" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end
}

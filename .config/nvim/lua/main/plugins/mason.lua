return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- list of servers for mason to install
            ensure_installed = {
                "lua_ls",
                "emmet_ls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
            },
        })
    end,
}

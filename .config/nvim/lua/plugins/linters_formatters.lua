return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre" },
        config = function()
            require("configs.conform")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = "BufReadPre",
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },
                htmldjango = { "djlint" },
            }
            vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "BufReadPost" }, {
                callback = function()
                    local lint_status, lint = pcall(require, "lint")
                    if lint_status then
                        lint.try_lint()
                    end
                end,
            })
        end,
    },
}

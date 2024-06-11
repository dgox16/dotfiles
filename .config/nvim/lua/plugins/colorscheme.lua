return {
    {
        "dgox16/oldworld.nvim",
        -- dir = "~/Documentos/project_nvim/oldworld.nvim/",
        priority = 1000,
        config = function()
            require("oldworld").setup(
                {
                    styles = {
                        booleans = { bold = true },
                        functions = { italic = true },
                        comments = { italic = true },
                    },
                }
            )
            vim.cmd.colorscheme("oldworld")
        end
    },
}

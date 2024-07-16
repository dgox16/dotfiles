return {
    {
        -- "dgox16/oldworld.nvim",
        dir = "~/Documents/projects_neovim/oldworld.nvim/",
        priority = 1000,
        opts = {
            styles = {
                booleans = { bold = true },
                functions = { italic = true },
                comments = { italic = true },
            },
        },
    },
    {
        "f4z3r/gruvbox-material.nvim",
        name = "gruvbox-material",
        lazy = false,
        priority = 1000,
        opts = {
            contrast = "hard",
        },
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                background = "hard",
                italics = true,

                -- colours_override = function(palette)
                --     palette.bg0 = "#161617"
                -- end,
            })
        end,
    },
}

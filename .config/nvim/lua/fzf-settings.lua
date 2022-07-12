require("fzf-lua").setup({
    files = {
        git_icons = false, -- show git icons?
        file_icons = false, -- show file icons?
        color_icons = false,
    },
    grep = {
        input_prompt = "Palabra a buscar ❯ ",
        git_icons = false, -- show git icons?
        file_icons = false, -- show file icons?
        color_icons = false,
    },
})

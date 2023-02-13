return {
    "NTBBloodbath/rest.nvim",
    ft = "http",
    opts = {
        result_split_horizontal = false,
        skip_ssl_verification = false,
        highlight = {
            enabled = true,
            timeout = 150,
        },
        result = {
            show_url = true,
            show_http_info = true,
            show_headers = true,
        },
        jump_to_request = false,

        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
    },
}

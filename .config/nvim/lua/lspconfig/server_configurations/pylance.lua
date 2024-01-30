local util = require("lspconfig.util")

local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
}
local function organize_imports()
    local params = {
        command = "pyright.organizeimports",
        arguments = { vim.uri_from_bufnr(0) },
    }
    vim.lsp.buf.execute_command(params)
end

return {
    default_config = {
        filetypes = { "python" },
        root_dir = util.root_pattern(unpack(root_files)),
        cmd = { "pylance", "--stdio" },
        single_file_support = true,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        settings = {
            editor = { formatOnType = true },
            python = {
                analysis = {
                    autoImportCompletions = true,
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    typeCheckingMode = "basic",
                    completeFunctionParens = true,
                    autoFormatStrings = true,
                    indexing = true,
                    inlayHints = {
                        variableTypes = true,
                        functionReturnTypes = true,
                        callArgumentNames = true,
                        pytestParameters = true,
                    },
                },
            },
        },
    },
    commands = {
        PylanceOrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        },
    },
}

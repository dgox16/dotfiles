local M = {}

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })

        print("Installing packer close and reopen Neovim...")
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "plugins.lua", "packer.lua" },
    group = group,
    callback = function()
        R("plugins")
        vim.cmd("PackerSync")
    end,
})

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

M.options = {
    auto_clean = true,
    compile_on_sync = true,
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
}

packer.init(M.options)

M.run = function(plugins)
    packer.startup(function(use)
        use({ "lewis6991/impatient.nvim" })
        use({ "wbthomason/packer.nvim" })

        for _, v in pairs(plugins) do
            use(v)
        end

        if packer_bootsrap then
            require("packer").sync()
        end
    end)
end

return M

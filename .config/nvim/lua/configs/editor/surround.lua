local present, nvim_surround = pcall(require, "nvim-surround")
if not present then
    return
end

nvim_surround.setup({})

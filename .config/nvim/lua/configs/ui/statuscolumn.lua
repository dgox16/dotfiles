local gitsigns_bar = "▌"

local gitsigns_hl_pool = {
    GitSignsAdd = "DiagnosticOk",
    GitSignsChange = "DiagnosticWarn",
    GitSignsChangedelete = "DiagnosticWarn",
    GitSignsDelete = "DiagnosticError",
    GitSignsTopdelete = "DiagnosticError",
    GitSignsUntracked = "NonText",
}

local diag_signs_icons = {
    DiagnosticSignError = " ",
    DiagnosticSignWarn = " ",
    DiagnosticSignInfo = " ",
    DiagnosticSignHint = " ",
    DiagnosticSignOk = " ",
}

local function get_sign_name(cur_sign)
    if cur_sign == nil then
        return nil
    end

    cur_sign = cur_sign[1]

    if cur_sign == nil then
        return nil
    end

    cur_sign = cur_sign.signs

    if cur_sign == nil then
        return nil
    end

    cur_sign = cur_sign[1]

    if cur_sign == nil then
        return nil
    end

    return cur_sign["name"]
end

local function mk_hl(group, sym)
    return table.concat({ "%#", group, "#", sym, "%*" })
end

local function get_name_from_group(bufnum, lnum, group)
    local cur_sign_tbl = vim.fn.sign_getplaced(bufnum, {
        group = group,
        lnum = lnum,
    })

    return get_sign_name(cur_sign_tbl)
end

local function get_statuscol_gitsign(bufnum, lnum)
    local cur_sign_nm = get_name_from_group(bufnum, lnum, "gitsigns_vimfn_signs_")

    if cur_sign_nm ~= nil then
        return mk_hl(gitsigns_hl_pool[cur_sign_nm], gitsigns_bar)
    else
        return " "
    end
end

local function get_statuscol_diag(bufnum, lnum)
    local cur_sign_nm = get_name_from_group(bufnum, lnum, "*")

    if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "DiagnosticSign") then
        return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm])
    else
        return " "
    end
end

_G.get_statuscol = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lnum = vim.v.lnum
    local str_table = {}

    local parts = {
        ["diagnostics"] = get_statuscol_diag(bufnr, lnum),
        ["fold"] = "%C",
        ["gitsigns"] = get_statuscol_gitsign(bufnr, lnum),
        ["num"] = "%{v:relnum?v:relnum:v:lnum}",
        ["sep"] = "%=",
        ["signcol"] = "%s",
        ["space"] = " ",
    }

    local order = {
        "diagnostics",
        "sep",
        "num",
        "space",
        "gitsigns",
        "fold",
        "space",
    }

    for _, val in ipairs(order) do
        table.insert(str_table, parts[val])
    end

    return table.concat(str_table)
end

vim.o.statuscolumn = "%!v:lua.get_statuscol()"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        local old_laststatus = vim.opt.laststatus
        local prev_showtabline = vim.opt.showtabline
        local prev_statuscolumn = vim.opt.statuscolumn
        vim.opt_local.winbar = nil
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
                vim.opt.laststatus = old_laststatus
                vim.opt.showtabline = prev_showtabline
                vim.opt.statuscolumn = prev_statuscolumn
            end,
        })
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0
        vim.o.statuscolumn = ""
    end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufAdd" }, {
    desc = "hide statuscolumn in nvimtree",
    group = vim.api.nvim_create_augroup("hide_nvimtree_stc", { clear = true }),
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "NvimTree" then
            vim.o.statuscolumn = ""
        end
        if vim.bo[opts.buf].filetype == "toggleterm" then
            vim.o.statuscolumn = ""
        end
    end,
})

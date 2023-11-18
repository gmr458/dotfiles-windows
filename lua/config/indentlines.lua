vim.opt.list = true
vim.opt.listchars:append({
    eol = "↲",
    tab = "│ ",
    trail = " ",
})

local function adjust_leadmultispace()
    local lead = "│"

    if vim.o.shiftwidth == 2 then
        lead = lead .. " "
    end

    if vim.o.shiftwidth == 4 then
        lead = lead .. "   "
    end

    vim.opt_local.listchars:append({ leadmultispace = lead })
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufWinEnter", "BufWrite", "BufWritePost" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd(":silent GuessIndent")
        adjust_leadmultispace()
    end,
})

adjust_leadmultispace()

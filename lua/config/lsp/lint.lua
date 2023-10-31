local ok, lint = pcall(require, "lint")
if not ok then
    vim.notify("lint could not be loaded")
    return
end

lint.linters_by_ft = {
    go = { "golangcilint" },
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    python = { "ruff" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

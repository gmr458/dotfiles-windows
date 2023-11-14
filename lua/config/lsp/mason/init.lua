local ok, mason = pcall(require, "mason")
if not ok then
    vim.notify("mason could not be loaded")
    return
end

mason.setup({
    ui = {
        border = {
            "┌",
            "─",
            "┐",
            "│",
            "┘",
            "─",
            "└",
            "│",
        },
    },
})

vim.api.nvim_create_user_command("MasonInstallAll", function()
    local packages = require("config.lsp.mason.packages")
    vim.cmd("MasonInstall " .. table.concat(packages, " "))
end, {})

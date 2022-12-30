local mason_loaded, mason = pcall(require, "mason")

if not mason_loaded then
    print("mason not loaded")
    return
end

mason.setup({
    -- Where Mason should put its bin location in your PATH. Can be one of:
    -- - "prepend" (default, Mason's bin location is put first in PATH)
    -- - "append" (Mason's bin location is put at the end of PATH)
    -- - "skip" (doesn't modify PATH)
    ---@type '"prepend"' | '"append"' | '"skip"'
    PATH = "append",
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
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

vim.api.nvim_create_user_command("MasonInstallListPackages", function()
    vim.cmd("MasonInstall " .. table.concat(require("config.lsp.mason.packages"), " "))
end, {})

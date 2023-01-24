local library = {}

if vim.fn.stdpath("config") == vim.loop.cwd() then
    library = vim.api.nvim_get_runtime_file("", true)
end

local config = {
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Replace",
                callSnippet = "Replace",
            },
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
            workspace = { library = library },
        },
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "lua-language-server.cmd"
    local cmd = { bin_name }
    config.cmd = cmd
end

return config

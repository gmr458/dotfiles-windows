local config = {
    -- settings = {
    --     gopls = {
    --         semanticTokens = true,
    --     },
    -- },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "gopls.cmd"
    config.cmd = { bin_name }
end

return config

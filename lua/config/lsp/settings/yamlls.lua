local ok, schemastore = pcall(require, "schemastore")
if not ok then
    vim.notify("schemastore could not be loaded")
    return
end

local config = {
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = { schemas = schemastore.json.schemas(), validate = { enable = true } },
    },
}

if vim.fn.has("win32") == 1 then
    local bin_name = "yaml-language-server.cmd"
    local cmd = { bin_name, "--stdio" }
    config.cmd = cmd
end

return config

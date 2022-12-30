local schemastore_loaded, schemastore = pcall(require, "schemastore")

if not schemastore_loaded then
    print("schemastore not loaded")
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

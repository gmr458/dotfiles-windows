local ok, schemastore = pcall(require, 'schemastore')
if not ok then
    vim.notify 'schemastore could not be loaded'
    return
end

local config = {
    settings = {
        toml = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
}

return config

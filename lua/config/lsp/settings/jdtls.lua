if vim.fn.has("win32") == 1 then
    local bin_name = "jdtls.cmd"
    local jdtls_config = require("lspconfig.server_configurations.jdtls")
    jdtls_config["default_config"]["cmd"][1] = bin_name
    return { cmd = jdtls_config["default_config"]["cmd"] }
end

return {}

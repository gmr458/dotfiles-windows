local util = require("lspconfig.util")

local omnisharp = require("mason-registry").get_package("omnisharp"):get_install_path()
local dll = util.path.join(omnisharp, "OmniSharp.dll")

local config = {
    cmd = { "dotnet", dll },
}

return config

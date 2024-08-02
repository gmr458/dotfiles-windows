local mason = require 'mason-registry'
local path = mason.get_package('omnisharp'):get_install_path()

local config = {
    cmd = {
        'dotnet',
        path .. '/libexec/OmniSharp.dll',
    },
}

return config

local util = require 'lspconfig.util'

local ok_mason, mason_registry = pcall(require, 'mason-registry')
if not ok_mason then
    vim.notify 'mason-registry could not be loaded'
    return
end

local tsserver_path =
    mason_registry.get_package('typescript-language-server'):get_install_path()

local config = {
    init_options = {
        typescript = {
            tsdk = util.path.join(
                tsserver_path,
                'node_modules',
                'typescript',
                'lib'
            ),
        },
    },
}

return config

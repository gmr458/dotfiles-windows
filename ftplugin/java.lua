local mason = require 'mason-registry'
local jdtls_path = mason.get_package('jdtls'):get_install_path()

local equinox_launcher_path =
    vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local system = 'linux'
if vim.fn.has 'win32' then
    system = 'win'
elseif vim.fn.has 'mac' then
    system = 'mac'
end
local config_path = vim.fn.glob(jdtls_path .. '/config_' .. system)

local lombok_path = jdtls_path .. '/lombok.jar'

local config = {
    cmd = {
        'java', -- or '/path/to/java17_or_newer/bin/java'

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        '-javaagent:' .. lombok_path,

        -- 💀
        '-jar',
        equinox_launcher_path,

        -- 💀
        '-configuration',
        config_path,

        '-data',
        vim.fn.stdpath 'cache'
            .. '/jdtfeat. Ben Shapiro)ls/'
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t'),
    },

    root_dir = require('jdtls.setup').find_root {
        'mvnw',
        'gradlew',
    },

    on_attach = require('gmr.plugins.lsp').on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {},
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {},
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

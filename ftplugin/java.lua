local mason = require 'mason-registry'
local jdtls_path = mason.get_package('jdtls'):get_install_path()
local java_debug_path =
    mason.get_package('java-debug-adapter'):get_install_path()
local java_test_path = mason.get_package('java-test'):get_install_path()

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

local jdtls = require 'jdtls'

local config = {
    cmd = {
        vim.fn.expand '~/.sdkman/candidates/java/21.0.3-tem/bin/java', -- or '/path/to/java17_or_newer/bin/java'

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

        '-jar',
        equinox_launcher_path,

        '-configuration',
        config_path,

        '-data',
        vim.fn.stdpath 'cache'
            .. '/jdtls/'
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t'),
    },

    root_dir = vim.fs.root(0, { 'mvnw', 'gradlew' }),

    on_attach = require('gmr.configs.lsp').on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            server = { launchMode = 'Hybrid' },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            configuration = {
                runtimes = {
                    {
                        name = 'JavaSE-1.8',
                        path = '~/.sdkman/candidates/java/8.0.402-tem',
                    },
                    {
                        name = 'JavaSE-11',
                        path = '~/.sdkman/candidates/java/11.0.22-tem',
                    },
                    {
                        name = 'JavaSE-17',
                        path = '~/.sdkman/candidates/java/17.0.10-tem',
                    },
                    {
                        name = 'JavaSE-21',
                        path = '~/.sdkman/candidates/java/21.0.3-tem',
                    },
                },
            },
            references = {
                includeDecompiledSources = true,
            },
            implementationsCodeLens = {
                enabled = false,
            },
            referenceCodeLens = {
                enabled = false,
            },
            inlayHints = {
                parameterNames = {
                    enabled = 'none',
                },
            },
            signatureHelp = {
                enabled = true,
                description = {
                    enabled = true,
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        },
        redhat = { telemetry = { enabled = false } },
    },
}

local bundles = {
    vim.fn.glob(
        java_debug_path
            .. '/extension/server/com.microsoft.java.debug.plugin-*.jar'
    ),
}

vim.list_extend(
    bundles,
    vim.split(vim.fn.glob(java_test_path .. '/extension/server/*.jar'), '\n')
)

config['init_options'] = {
    bundles = bundles,
}

jdtls.start_or_attach(config)

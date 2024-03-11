return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspStart' },
    dependencies = {
        require 'gmr.plugins.neodev',
        -- require 'gmr.plugins.null-ls',
        require 'gmr.plugins.trouble',
        { 'b0o/SchemaStore.nvim' },
    },
    config = function()
        local lspconfig = require 'lspconfig'

        local lspconfiguser = require 'gmr.configs.lsp'
        lspconfiguser.diagnostic_config()
        lspconfiguser.handlers()

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('lspconfig.ui.windows').default_options.border = 'single'

        local servers = require('gmr.configs.lsp.servers').to_setup
        for _, server in pairs(servers) do
            local server_opts = {
                on_attach = lspconfiguser.on_attach,
                capabilities = capabilities,
            }

            local has_custom_opts, server_custom_opts =
                pcall(require, 'gmr.configs.lsp.settings.' .. server)
            if has_custom_opts then
                server_opts = vim.tbl_deep_extend(
                    'force',
                    server_opts,
                    server_custom_opts
                )
            end

            local has_custom_commands, server_custom_commands =
                pcall(require, 'gmr.configs.lsp.commands.' .. server)
            if has_custom_commands then
                server_opts.commands = server_custom_commands
            end

            if server == 'lua_ls' then
                require('neodev').setup {}
            end

            lspconfig[server].setup(server_opts)
        end
    end,
}

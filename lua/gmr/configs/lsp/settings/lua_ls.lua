-- https://luals.github.io/wiki/settings/
local config = {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if
            vim.loop.fs_stat(path .. '/.luarc.json')
            or vim.loop.fs_stat(path .. '/.luarc.jsonc')
        then
            return
        end

        client.config.settings.Lua =
            vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    version = 'LuaJIT',
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME,
                        vim.fn.stdpath 'data' .. '/lazy',
                    },
                },
            })
    end,
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
                keywordSnippet = 'Replace',
            },
            hint = { enable = true },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
}

return config

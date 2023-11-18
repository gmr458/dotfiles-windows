local cmd = {
    'ngserver',
    '--stdio',
    '--tsProbeLocations',
    table.concat({
        '/home/gdmr/.local/share/nvim/mason/packages/angular-language-server',
        vim.loop.cwd(),
    }, ','),
    '--ngProbeLocations',
    table.concat({
        '/home/gdmr/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server',
        vim.loop.cwd(),
    }, ','),
}

local config = {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
}

return config

local ok, neotest = pcall(require, 'neotest')
if not ok then
    vim.notify 'neotest could not be loaded'
    return
end

neotest.setup {
    adapters = {
        require 'neotest-python',
        require 'neotest-go',
        require 'neotest-jest',
        require 'neotest-vitest',
        require 'neotest-rust',
        require 'neotest-dotnet',
    },
}

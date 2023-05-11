local ok, dap, dapui

ok, dap = pcall(require, "dap")
if not ok then
    vim.notify("dap could not be loaded")
    return
end

ok, dapui = pcall(require, "dapui")
if not ok then
    vim.notify("dapui could not be loaded")
    return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

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

vim.api.nvim_create_user_command("DapUiClose", function()
  require("dapui").close()
end, {})

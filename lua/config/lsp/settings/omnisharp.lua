local env_var_user_dir = "HOME"
local omnisharp_path = "/.local/share/nvim/mason/packages/omnisharp/"

if vim.fn.has("win32") == 1 then
    env_var_user_dir = "USERPROFILE"
    omnisharp_path = "\\AppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\"
end

local user_directory = os.getenv(env_var_user_dir)

local omnisharp_dll_path = user_directory .. omnisharp_path .. "OmniSharp.dll"

return { cmd = { "dotnet", omnisharp_dll_path } }

local feline_loaded, feline = pcall(require, "feline")

if not feline_loaded then
    print("feline not loaded")
    return
end

local themes = {
    catppuccin = "catppuccin",
    enfocado = "enfocado",
    kanagawa = "kanagawa",
}

local styles = {
    complete = "complete",
    float = "float",
}

local theme = themes.catppuccin
local style = styles.float

feline.setup({
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^TelescopePrompt$",
            "^alpha$",
            "^lsp%-installer$",
            "^lspinfo$",
            "^dashboard$",
        },
        buftypes = {
            "^terminal$",
        },
        bufnames = {},
    },
    disable = { filetypes = { "^alpha$", "^dashboard$" } },
    theme = require("config.feline.themes." .. theme .. "." .. style).palette(),
    components = require("config.feline.themes." .. theme .. "." .. style).components(),
})

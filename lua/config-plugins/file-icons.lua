local colors = {
    white = "#abb2bf",
    darker_black = "#1b1f27",
    black = "#1e222a", --  nvim bg
    black2 = "#252931",
    one_bg = "#282c34", -- real bg of onedark
    one_bg2 = "#353b45",
    one_bg3 = "#30343c",
    grey = "#42464e",
    grey_fg = "#565c64",
    grey_fg2 = "#6f737b",
    light_grey = "#6f737b",
    red = "#d47d85",
    baby_pink = "#DE8C92",
    pink = "#ff75a0",
    line = "#2a2e36", -- for lines like vertsplit
    green = "#A3BE8C",
    vibrant_green = "#7eca9c",
    nord_blue = "#81A1C1",
    blue = "#61afef",
    yellow = "#e7c787",
    sun = "#EBCB8B",
    purple = "#b4bbc8",
    dark_purple = "#c882e7",
    teal = "#519ABA",
    orange = "#fca2aa",
    cyan = "#a3b8ef",
    statusline_bg = "#22262e",
    lightbg = "#2d3139",
    lightbg2 = "#262a32",
    pmenu_bg = "#A3BE8C",
    folder_bg = "#61afef",
}

require("nvim-web-devicons").setup({
    override = {
        c = {
            icon = "",
            color = colors.blue,
            name = "c",
        },
        css = {
            icon = "",
            color = colors.blue,
            name = "css",
        },
        deb = {
            icon = "",
            color = colors.cyan,
            name = "deb",
        },
        Dockerfile = {
            icon = "",
            color = colors.cyan,
            name = "Dockerfile",
        },
        html = {
            icon = "",
            color = colors.baby_pink,
            name = "html",
        },
        jpeg = {
            icon = "",
            color = colors.dark_purple,
            name = "jpeg",
        },
        jpg = {
            icon = "",
            color = colors.dark_purple,
            name = "jpg",
        },
        js = {
            icon = "",
            color = colors.sun,
            name = "js",
        },
        kt = {
            icon = "󱈙",
            color = colors.orange,
            name = "kt",
        },
        lock = {
            icon = "",
            color = colors.red,
            name = "lock",
        },
        lua = {
            icon = "",
            color = colors.blue,
            name = "lua",
        },
        mp3 = {
            icon = "",
            color = colors.white,
            name = "mp3",
        },
        mp4 = {
            icon = "",
            color = colors.white,
            name = "mp4",
        },
        out = {
            icon = "",
            color = colors.white,
            name = "out",
        },
        png = {
            icon = "",
            color = colors.dark_purple,
            name = "png",
        },
        py = {
            icon = "",
            color = colors.cyan,
            name = "py",
        },
        toml = {
            icon = "",
            color = colors.blue,
            name = "toml",
        },
        ts = {
            icon = "ﯤ",
            color = colors.teal,
            name = "ts",
        },
        rb = {
            icon = "",
            color = colors.pink,
            name = "rb",
        },
        rpm = {
            icon = "",
            color = colors.orange,
            name = "rpm",
        },
        vue = {
            icon = "﵂",
            color = colors.vibrant_green,
            name = "vue",
        },
        xz = {
            icon = "",
            color = colors.sun,
            name = "xz",
        },
        zip = {
            icon = "",
            color = colors.sun,
            name = "zip",
        },
    },
})

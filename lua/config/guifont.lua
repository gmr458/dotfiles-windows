local fonts = {
    caskaydia_cove = {
        name = 'CaskaydiaCove Nerd Font Mono',
        height = '11',
    },
    consolas = {
        name = 'Consolas Nerd Font Mono',
        height = '11',
    },
    comic_mono = {
        name = 'ComicMono Nerd Font Mono',
        height = '11',
    },
    fira_code = {
        name = 'FiraCodeCustom Nerd Font Mono',
        height = '11',
    },
    iosevka_custom = {
        name = 'IosevkaCustom Nerd Font Mono',
        height = '12',
    },
    roboto_mono = {
        name = 'RobotoMono Nerd Font Mono',
        height = '11',
    },
}

local font = fonts.iosevka_custom

return font.name .. ':' .. 'h' .. font.height .. ':' .. '#h-slight'

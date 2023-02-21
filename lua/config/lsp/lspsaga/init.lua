local lspsaga_loaded, lspsaga = pcall(require, "lspsaga")

if not lspsaga_loaded then
    print("lspsaga not loaded")
    return
end

lspsaga.setup({
    -- default options
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    request_timeout = 2000,
    -- :Lspsaga lsp_finder options
    finder = {
        max_height = 0.5,
        keys = {
            jump_to = "p",
            edit = { "o", "<CR>" },
            vsplit = "s",
            split = "i",
            tabe = "t",
            tabnew = "r",
            quit = { "q", "<ESC>" },
            close_in_preview = "<ESC>",
        },
    },
    -- :Lspsaga peek_definition options
    definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
    },
    -- :Lspsaga code_action options
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = true,
        keys = {
            -- string | table type
            quit = "q",
            exec = "<CR>",
        },
    },
    -- :Lspsaga Lightbulb options
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = false,
        sign_priority = 40,
        virtual_text = false,
    },
    -- :Lspsaga diagnostic_jump_next options
    diagnostic = {
        on_insert = false,
        on_insert_follow = false,
        insert_winblend = 0,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        max_width = 0.7,
        custom_fix = nil,
        custom_msg = nil,
        text_hl_follow = false,
        border_follow = true,
        keys = {
            exec_action = "o",
            quit = "q",
            go_action = "g",
        },
    },
    -- :Lspsaga rename options
    rename = {
        quit = "<C-c>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
    },
    -- :Lspsaga outline options
    outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = false,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = "o",
            expand_collapse = "u",
            quit = "q",
        },
    },
    -- :Lspsaga incoming_calls options
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "o",
            quit = "q",
            expand_collapse = "u",
        },
    },
    -- :Lspsaga symbols in winbar options
    symbol_in_winbar = {
        enable = false,
        separator = "  ",
        ignore_patterns = {},
        hide_keyword = false,
        show_file = true,
        folder_level = 2,
        respect_root = true,
        color_mode = true,
    },
    -- :Lspsaga beacon options
    beacon = {
        enable = false,
        frequency = 7,
    },
    -- :Lspsaga UI options
    ui = {
        -- This option only works in Neovim 0.9
        title = false,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "Code Action",
        incoming = "Incoming",
        outgoing = "Outgoing",
        hover = "Hover",
        colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
        kind = {},
    },
})

-- vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("v", "<space>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

vim.keymap.set("n", "<space>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

vim.keymap.set("n", "<space>fd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

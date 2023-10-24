local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
    vim.notify("scrollbar could not be loaded")
    return
end

scrollbar.setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000,
    max_lines = false,
    handle = {
        text = " ",
        color = nil,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true,
    },
    marks = {
        Cursor = {
            text = "-",
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            text = "│",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "│",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "_",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "NvimTree",
        "lspsagafinder",
        "alpha",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = false,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
    },
})

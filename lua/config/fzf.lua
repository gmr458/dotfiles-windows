local ok, fzf = pcall(require, 'fzf-lua')
if not ok then
    vim.notify 'fzf-lua could not be loaded'
    return
end

local actions = require 'fzf-lua.actions'

fzf.setup {
    winopts = {
        border = 'single',
        height = 0.9,
        width = 0.9,
        preview = {
            vertical = 'down:65%',
            horizontal = 'right:60%',
            layout = 'vertical',
        },
        on_create = function()
            vim.keymap.set(
                't',
                '<tab>',
                '<down>',
                { silent = true, buffer = true }
            )
            vim.keymap.set(
                't',
                '<S-tab>',
                '<up>',
                { silent = true, buffer = true }
            )
        end,
    },
    keymap = {
        builtin = {
            ['<C-y>'] = 'toggle-preview',
            ['<C-d>'] = 'preview-page-down',
            ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
            ['tab'] = 'toggle-down',
            ['shift-tab'] = 'toggle-up',
            ['ctrl-d'] = 'preview-page-down',
            ['ctrl-u'] = 'preview-page-up',
        },
    },
    actions = {
        files = {
            ['default'] = actions.file_edit,
            ['ctrl-x'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
        },
    },
    fzf_opts = {
        ['--color'] = 'bg+:-1',
        ['--info'] = 'inline-right',
        ['--pointer'] = '❯',
        ['--no-bold'] = '',
    },
    autocmds = {
        prompt = '   AutoCmds ❯ ',
    },
    files = {
        prompt = '   Files ❯ ',
        git_icons = false,
        cwd_prompt = false,
        fzf_opts = { ['--info'] = 'inline-right' },
        ['--no-bold'] = '',
    },
    git = {
        files = {
            prompt = '   Git Files ❯ ',
        },
        status = {
            prompt = '   Git Status ❯ ',
            preview_pager = string.format(
                'delta --%s --line-numbers --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=\'omit\' --file-style=\'omit\'',
                vim.o.background
            ),
        },
        commits = {
            prompt = '   Git Commits ❯ ',
        },
        bcommits = {
            prompt = '   Git BCommits ❯ ',
        },
        branches = {
            prompt = '   Git Branches ❯ ',
        },
        tags = {
            prompt = '   Git Tags ❯ ',
        },
        stash = {
            prompt = '   Git Stash ❯ ',
        },
    },
    grep = {
        prompt = '   Grep ❯ ',
        input_prompt = '   Grep for ❯ ',
        git_icons = false,
        fzf_opts = {
            ['--info'] = 'inline-right',
            ['--no-bold'] = '',
        },
    },
    args = {
        prompt = '   Args ❯ ',
    },
    help_tags = {
        prompt = '   Help ❯ ',
        fzf_opts = {
            ['--info'] = 'inline-right',
            ['--no-bold'] = '',
        },
    },
    oldfiles = {
        prompt = '   Recent Files ❯ ',
    },
    buffers = {
        prompt = '   Recent Buffers ❯ ',
    },
    tabs = {
        prompt = '   Tabs ❯ ',
    },
    lines = {
        prompt = '   Lines ❯ ',
    },
    blines = {
        prompt = '   BLines ❯ ',
    },
    tags = {
        prompt = '   Tags ❯ ',
        git_icons = false,
    },
    btags = {
        prompt = '   BTags ❯ ',
        git_icons = false,
    },
    colorschemes = {
        prompt = '   Colorschemes ❯ ',
    },
    keymaps = {
        prompt = '   Keymaps ❯ ',
    },
    quickfix = {
        git_icons = false,
    },
    quickfix_stack = {
        prompt = '   Quickfix Stack ❯ ',
    },
    lsp = {
        prompt_postfix = ' ❯ ',
        symbols = {
            fzf_opts = {
                ['--info'] = 'inline-right',
                ['--no-bold'] = '',
            },
        },
        code_actions = {
            prompt = '   LSP Code Actions ❯ ',
            previewer = 'codeaction_native',
            -- preview_pager = 'delta ',
            preview_pager = string.format(
                'delta --%s --line-numbers --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style=\'omit\' --file-style=\'omit\'',
                vim.o.background
            ),
        },
        finder = {
            prompt = '   LSP Finder ❯ ',
        },
        workspace_symbol = {
            prompt = '   LSP Live Workspace Symbols ❯ ',
        },
    },
    diagnostics = {
        prompt = '   Diagnostics ❯ ',
    },
}

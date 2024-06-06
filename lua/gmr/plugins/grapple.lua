return {
    'cbochs/grapple.nvim',
    cmd = 'Grapple',
    config = function()
        require('grapple').setup {
            tag_title = function(scope)
                return vim.fn.fnamemodify(scope.id, ':t')
            end,
            styles = {
                custom = function(entity, _)
                    local Path = require 'grapple.path'

                    local parent_mark = {
                        virt_text = {
                            {
                                Path.parent(Path.fs_short(entity.tag.path)),
                                'GrappleHint',
                            },
                        },
                        virt_text_pos = 'eol',
                    }

                    local line = {
                        display = Path.base(entity.tag.path),
                        marks = { parent_mark },
                    }

                    return line
                end,
            },
            style = 'custom',
            win_opts = {
                width = 50,
                height = 12,
                row = 0.3,
            },
        }
    end,
}

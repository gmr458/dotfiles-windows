return {
    'b3nj5m1n/kommentary',
    event = 'BufReadPost',
    config = function()
        local config = require 'kommentary.config'

        config.configure_language('svelte', {
            prefer_multi_line_comments = true,
            multi_line_comment_strings = { '<!--', '-->' },
        })

        config.configure_language('dosini', {
            prefer_single_line_comments = true,
            single_line_comment_string = '#',
        })

        config.configure_language(
            'default',
            { prefer_single_line_comments = true }
        )

        config.use_extended_mappings()
    end,
}

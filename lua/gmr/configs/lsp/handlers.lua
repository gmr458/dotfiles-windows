local M = {}

function M.goto_definition()
    local util = vim.lsp.util
    local log = require 'vim.lsp.log'
    local api = vim.api

    local handler = function(_, result, ctx)
        local split_cmd = 'vsplit'

        if
            vim.uv.os_uname().sysname == 'Linux'
            and os.getenv 'DESKTOP_SESSION' == 'hyprland'
        then
            local output_hyprctl = vim.fn.system 'hyprctl -j activewindow'
            --- @class HyprlandWindow
            --- @field size number[]
            local json = vim.json.decode(output_hyprctl)

            local size_x, size_y = json.size[1], json.size[2]

            if size_y > size_x then
                split_cmd = 'split'
            end
        end

        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, 'No location found')
            return nil
        end

        local first_visible_line = vim.fn.line 'w0'
        local last_visible_line = vim.fn.line 'w$'

        local definition = result[1]

        local buf = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(buf)

        local uri = definition.uri or definition.targetUri

        if 'file://' .. filename ~= uri then
            vim.cmd(split_cmd)
        else
            local range = definition.range or definition.targetSelectionRange
            local line_definition = range.start.line

            if line_definition == 0 then
                line_definition = 1
            end

            if
                line_definition < first_visible_line
                or line_definition > last_visible_line
            then
                vim.cmd(split_cmd)
            end
        end

        if vim.islist(result) then
            util.jump_to_location(result[1], 'utf-8')

            if #result > 1 then
                vim.fn.setqflist(util.locations_to_items(result, 'utf-8'))
                api.nvim_command 'copen'
                api.nvim_command 'wincmd p'
            end
        else
            util.jump_to_location(result, 'utf-8')
        end
    end

    return handler
end

return M

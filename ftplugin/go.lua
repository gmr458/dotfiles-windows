local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local snippet_node = luasnip.snippet_node
local insert_node = luasnip.insert_node
local text_node = luasnip.text_node
local dynamic_node = luasnip.dynamic_node
local choice_node = luasnip.choice_node

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local ts_locals = require 'nvim-treesitter.locals'
local ts_utils = require 'nvim-treesitter.ts_utils'

local get_node_text = vim.treesitter.get_node_text

local transforms = {
    int = function(_, _)
        return text_node '0'
    end,
    bool = function(_, _)
        return text_node 'false'
    end,
    string = function(_, _)
        return text_node [[""]]
    end,
    error = function(_, info)
        if info then
            info.index = info.index + 1

            return choice_node(info.index, {
                text_node(info.err_name),
                text_node(
                    string.format(
                        'errors.Wrap(%s, "%s")',
                        info.err_name,
                        info.func_name
                    )
                ),
            })
        else
            return text_node 'err'
        end
    end,
    -- Types with a "*" mean they are pointers, so return nil
    [function(text)
        return string.find(text, '*', 1, true) ~= nil
    end] = function(_, _)
        return text_node 'nil'
    end,
}

local function transform(text, info)
    local function condition_matches(condition, ...)
        if type(condition) == 'string' then
            return condition == text
        else
            return condition(...)
        end
    end

    for condition, result in pairs(transforms) do
        if condition_matches(condition, text, info) then
            return result(text, info)
        end
    end

    return text_node(text)
end

local handlers = {
    parameter_list = function(node, info)
        local result = {}

        local count = node:named_child_count()
        for idx = 0, count - 1 do
            local matching_node = node:named_child(idx)
            local type_node = matching_node:field('type')[1]
            table.insert(result, transform(get_node_text(type_node, 0), info))
            if idx ~= count - 1 then
                table.insert(result, text_node { ', ' })
            end
        end

        return result
    end,
    type_identifier = function(node, info)
        local text = get_node_text(node, 0)
        return { transform(text, info) }
    end,
}

local function_node_types = {
    function_declaration = true,
    method_declaration = true,
    func_literal = true,
}

local function go_result_type(info)
    local cursor_node = ts_utils.get_node_at_cursor()
    local scope = ts_locals.get_scope_tree(cursor_node, 0)

    local function_node
    for _, v in ipairs(scope) do
        if function_node_types[v:type()] then
            function_node = v
            break
        end
    end

    if not function_node then
        print 'Not inside of a function'
        return text_node ''
    end

    local query = vim.treesitter.query.parse(
        'go',
        [[
[
    (method_declaration result: (_) @id)
    (function_declaration result: (_) @id)
    (func_literal result: (_) @id)
]
        ]]
    )

    for _, node in query:iter_captures(function_node, 0) do
        if handlers[node:type()] then
            return handlers[node:type()](node, info)
        end
    end
end

local go_return_values = function(args)
    return snippet_node(
        nil,
        go_result_type {
            index = 0,
            err_name = args[1][1],
            func_name = args[2][1],
        }
    )
end

luasnip.add_snippets('go', {
    snippet(
        'ifvalerr',
        fmta(
            [[
<val>, <err> := <f>(<args>)
if <err_same> != nil {
	return <result>
}<finish>
            ]],
            {
                val = insert_node(1),
                err = insert_node(2),
                f = insert_node(3),
                args = insert_node(4),
                err_same = rep(2),
                result = dynamic_node(5, go_return_values, { 2, 3 }),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'iferr',
        fmta(
            [[
<err> := <f>(<args>)
if <err_same> != nil {
	return <result>
}<finish>
            ]],
            {
                err = insert_node(1),
                f = insert_node(2),
                args = insert_node(3),
                err_same = rep(1),
                result = dynamic_node(4, go_return_values, { 1, 2 }),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'if',
        fmta(
            [[
if <condition> {
    <body>
}<finish>
            ]],
            {
                condition = insert_node(1),
                body = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'elseif',
        fmta(
            [[
else if <condition> {
    <body>
}<finish>
            ]],
            {
                condition = insert_node(1),
                body = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'else',
        fmta(
            [[
else {
    <body>
}<finish>
            ]],
            {
                body = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'switch',
        fmta(
            [[
switch <expression> {
<finish>
}
            ]],
            {
                expression = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'switcht',
        fmta(
            [[
switch {
<finish>
}
            ]],
            {
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'select',
        fmta(
            [[
select {
<finish>
}
            ]],
            {
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'case',
        fmta(
            [[
case <case>:
    <body_case>
            ]],
            {
                case = insert_node(1),
                body_case = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'casei',
        fmta(
            [[
case <case>: <body_case>
            ]],
            {
                case = insert_node(1),
                body_case = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'default',
        fmta(
            [[
default:
    <body_case>
            ]],
            {
                body_case = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'defaulti',
        fmta(
            [[
default: <body_case>
            ]],
            {
                body_case = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'for',
        fmta(
            [[
for <condition> {
    <body>    
}
            ]],
            {
                condition = insert_node(1),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'fori',
        fmta(
            [[
for <init_stmt> := 0; <condition>; <post_stmt>++ {
    <body>    
}
            ]],
            {
                init_stmt = insert_node(1),
                condition = insert_node(2),
                post_stmt = rep(1),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'forr',
        fmta(
            [[
for <key>, <value> := range <range_expression> {
    <body>
}
            ]],
            {
                key = insert_node(1),
                value = insert_node(2),
                range_expression = insert_node(3),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'tys',
        fmta(
            [[
type <identifier> struct {
    <field>
}
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'tyf',
        fmta(
            [[
type <identifier> func(<parameters>) <return_type>
            ]],
            {
                identifier = insert_node(1),
                parameters = insert_node(2),
                return_type = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'tyi',
        fmta(
            [[
type <identifier> interface {
    <field>
}
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'func',
        fmta(
            [[
func <func_name>(<parameters>) <return_type> {
    <body>
}
            ]],
            {
                func_name = insert_node(1),
                parameters = insert_node(2),
                return_type = insert_node(3),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'funcm',
        fmta(
            [[
func (<receiver_name> <receiver_type>) <func_name>(<parameters>) <return_type> {
    <body>
}
            ]],
            {
                receiver_name = insert_node(1),
                receiver_type = insert_node(2),
                func_name = insert_node(3),
                parameters = insert_node(4),
                return_type = insert_node(5),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'typeb',
        fmta(
            [[
type (
    <finish>
)
            ]],
            {
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'varb',
        fmta(
            [[
var (
    <finish>
)
            ]],
            {
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'constb',
        fmta(
            [[
const (
    <finish>
)
            ]],
            {
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets('go', {
    snippet(
        'importb',
        fmta(
            [[
import (
    "<package>"
)
            ]],
            {
                package = insert_node(0),
            }
        )
    ),
})

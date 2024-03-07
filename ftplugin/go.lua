local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

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

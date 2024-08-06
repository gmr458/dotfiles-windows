local luasnip = require 'luasnip'
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local filetype = 'go'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if <condition> {
    <body>
}<finish>
            ]],
            {
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'elseif',
        fmta(
            [[
else if <condition> {
    <body>
}<finish>
            ]],
            {
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'else',
        fmta(
            [[
else {
    <body>
}<finish>
            ]],
            {
                body = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'switch',
        fmta(
            [[
switch <expression> {
<finish>
}
            ]],
            {
                expression = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'switcht',
        fmta(
            [[
switch {
<finish>
}
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'select',
        fmta(
            [[
select {
<finish>
}
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'case',
        fmta(
            [[
case <case>:
    <body_case>
            ]],
            {
                case = luasnip.insert_node(1),
                body_case = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'casei',
        fmta(
            [[
case <case>: <body_case>
            ]],
            {
                case = luasnip.insert_node(1),
                body_case = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'default',
        fmta(
            [[
default:
    <body_case>
            ]],
            {
                body_case = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'defaulti',
        fmta(
            [[
default: <body_case>
            ]],
            {
                body_case = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'for',
        fmta(
            [[
for <condition> {
    <body>    
}
            ]],
            {
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fori',
        fmta(
            [[
for <init_stmt> := 0; <condition>; <post_stmt>++ {
    <body>    
}
            ]],
            {
                init_stmt = luasnip.insert_node(1),
                condition = luasnip.insert_node(2),
                post_stmt = rep(1),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forr',
        fmta(
            [[
for <key>, <value> := range <range_expression> {
    <body>
}
            ]],
            {
                key = luasnip.insert_node(1),
                value = luasnip.insert_node(2),
                range_expression = luasnip.insert_node(3),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'tys',
        fmta(
            [[
type <identifier> struct {
    <field>
}
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'tyf',
        fmta(
            [[
type <identifier> func(<parameters>) <return_type>
            ]],
            {
                identifier = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                return_type = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'tyi',
        fmta(
            [[
type <identifier> interface {
    <field>
}
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'func',
        fmta(
            [[
func <func_name>(<parameters>) <return_type> {
    <body>
}
            ]],
            {
                func_name = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                return_type = luasnip.insert_node(3),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'funcm',
        fmta(
            [[
func (<receiver_name> <receiver_type>) <func_name>(<parameters>) <return_type> {
    <body>
}
            ]],
            {
                receiver_name = luasnip.insert_node(1),
                receiver_type = luasnip.insert_node(2),
                func_name = luasnip.insert_node(3),
                parameters = luasnip.insert_node(4),
                return_type = luasnip.insert_node(5),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'typeb',
        fmta(
            [[
type (
    <finish>
)
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'varb',
        fmta(
            [[
var (
    <finish>
)
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'constb',
        fmta(
            [[
const (
    <finish>
)
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'importb',
        fmta(
            [[
import (
    "<package>"
)
            ]],
            {
                package = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'json',
        fmta(
            [[
`json:"<finish>"`
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'form',
        fmta(
            [[
`form:"<finish>"`
            ]],
            {
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

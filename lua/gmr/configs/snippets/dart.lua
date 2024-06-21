local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local filetype = 'dart'

luasnip.add_snippets(filetype, {
    snippet(
        'if',
        fmta(
            [[
if (<condition>) {
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

luasnip.add_snippets(filetype, {
    snippet(
        'elseif',
        fmta(
            [[
else if (<condition>) {
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

luasnip.add_snippets(filetype, {
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

luasnip.add_snippets(filetype, {
    snippet(
        'switch',
        fmta(
            [[
switch (<expression>) {
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

luasnip.add_snippets(filetype, {
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

luasnip.add_snippets(filetype, {
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

luasnip.add_snippets(filetype, {
    snippet(
        'for',
        fmta(
            [[
for (<condition>) {
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

luasnip.add_snippets(filetype, {
    snippet(
        'fori',
        fmta(
            [[
for (int <init_stmt> = 0; <condition>; <post_stmt>++) {
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

luasnip.add_snippets(filetype, {
    snippet(
        'forin',
        fmta(
            [[
for (final <property> in <object>) {
    <statement>
}<finish>
        ]],
            {
                property = insert_node(1),
                object = insert_node(2),
                statement = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'while',
        fmta(
            [[
while (<condition>) {
    <statement>
}<finish>
        ]],
            {
                condition = insert_node(1),
                statement = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'function',
        fmta(
            [[
<return_type> <method_name>(<parameter_list>) {
    <body>
}<finish>
            ]],
            {
                return_type = insert_node(1),
                method_name = insert_node(2),
                parameter_list = insert_node(3),
                body = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'import',
        fmta(
            [[
import '<package>';
            ]],
            {
                package = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'extends',
        fmta(
            [[
extends <other_class>
            ]],
            {
                other_class = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'with',
        fmta(
            [[
with <mixin>
            ]],
            {
                mixin = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implements',
        fmta(
            [[
implements <interface>
            ]],
            {
                interface = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'class',
        fmta(
            [[
class <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'absclass',
        fmta(
            [[
abstract class <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'classe',
        fmta(
            [[
class <identifier> extends <class> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                class = insert_node(2),
                field = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'classim',
        fmta(
            [[
class <identifier> implements <class> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                class = insert_node(2),
                field = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'enum',
        fmta(
            [[
enum <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'mixin',
        fmta(
            [[
mixin <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                field = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local filetype = 'kotlin'

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
        'ifinl',
        fmta(
            [[
if (<condition>) <statement>
            ]],
            {
                condition = insert_node(1),
                statement = insert_node(0),
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
        'when',
        fmta(
            [[
when (<expression>) {
    <case>
}<finish>
            ]],
            {
                expression = insert_node(1),
                case = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'trycatch',
        fmta(
            [[
try {
    <try_statements>
} catch (<var_exception>: <type_exception> ) {
    println(<exception>.message);
}<finish>
            ]],
            {
                try_statements = insert_node(3),
                type_exception = insert_node(2),
                var_exception = insert_node(1),
                exception = rep(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'catch',
        fmta(
            [[
catch (<var_exception>: <type_exception> ) {
    <block>
    println(<exception>.message);
}<finish>
            ]],
            {
                var_exception = insert_node(1),
                type_exception = insert_node(2),
                exception = rep(1),
                block = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'finally',
        fmta(
            [[
finally {
    <block>
}<finish>
            ]],
            {
                block = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'trycatchfin',
        fmta(
            [[
try {
    <try_statements>
} catch (<var_exception>: <type_exception> ) {
    <catch_statements>
    println(<exception>.message);
} finally {
    <finally_statements>
}<finish>
            ]],
            {
                var_exception = insert_node(1),
                type_exception = insert_node(2),
                exception = rep(1),
                try_statements = insert_node(3),
                catch_statements = insert_node(4),
                finally_statements = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fun',
        fmta(
            [[
fun <func_name>(<parameters>): <return_type> {
    <body>
}<finish>
            ]],
            {
                func_name = insert_node(1),
                parameters = insert_node(2),
                return_type = insert_node(3),
                body = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'funinl',
        fmta(
            [[
fun <func_name>(<parameters>): <return_type> = <body>
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

luasnip.add_snippets(filetype, {
    snippet(
        'lambda',
        fmt(
            [[
val {lambda_name} = {{ {parameters} -> {body} }}
            ]],
            {
                lambda_name = insert_node(1),
                parameters = insert_node(2),
                body = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fungn',
        fmt(
            [[
fun <{generic_parameters}> {func_name}({parameters}): {return_type} {{
    {body}
}}{finish}
            ]],
            {
                generic_parameters = insert_node(1),
                func_name = insert_node(2),
                parameters = insert_node(3),
                return_type = insert_node(4),
                body = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fungnwh',
        fmt(
            [[
fun <{generic_parameters}> {func_name}({parameters}): {return_type}
where {where_clause},
{{
    {body}
}}{finish}
            ]],
            {
                generic_parameters = insert_node(1),
                func_name = insert_node(2),
                parameters = insert_node(3),
                return_type = insert_node(4),
                where_clause = insert_node(5),
                body = insert_node(6),
                finish = insert_node(0),
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
        'classgn',
        fmt(
            [[
class {identifier}<{generic_parameters}> {{
    {field}
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                generic_parameters = insert_node(2),
                field = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'classei',
        fmta(
            [[
class <identifier> : <class> {
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
        'interface',
        fmta(
            [[
interface <identifier>
{
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
        'interface',
        fmt(
            [[
interface {identifier}<{generic_parameters}> {{
    {field}
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                generic_parameters = insert_node(2),
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
enum class <identifier> {
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
        'dowhile',
        fmta(
            [[
do {
    <block>
} while (<statement>);
            ]],
            {
                statement = insert_node(1),
                block = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'for',
        fmta(
            [[
for (<item> in <collection>) {
    <statement>
}<finish>
        ]],
            {
                item = insert_node(1),
                collection = insert_node(2),
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

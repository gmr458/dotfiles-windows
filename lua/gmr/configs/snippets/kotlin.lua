local luasnip = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local filetype = 'kotlin'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if (<condition>) {
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
        'ifinl',
        fmta(
            [[
if (<condition>) <statement>
            ]],
            {
                condition = luasnip.insert_node(1),
                statement = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'elseif',
        fmta(
            [[
else if (<condition>) {
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
        'when',
        fmta(
            [[
when (<expression>) {
    <case>
}<finish>
            ]],
            {
                expression = luasnip.insert_node(1),
                case = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                try_statements = luasnip.insert_node(3),
                type_exception = luasnip.insert_node(2),
                var_exception = luasnip.insert_node(1),
                exception = rep(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'catch',
        fmta(
            [[
catch (<var_exception>: <type_exception> ) {
    <block>
    println(<exception>.message);
}<finish>
            ]],
            {
                var_exception = luasnip.insert_node(1),
                type_exception = luasnip.insert_node(2),
                exception = rep(1),
                block = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'finally',
        fmta(
            [[
finally {
    <block>
}<finish>
            ]],
            {
                block = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                var_exception = luasnip.insert_node(1),
                type_exception = luasnip.insert_node(2),
                exception = rep(1),
                try_statements = luasnip.insert_node(3),
                catch_statements = luasnip.insert_node(4),
                finally_statements = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fun',
        fmta(
            [[
fun <func_name>(<parameters>): <return_type> {
    <body>
}<finish>
            ]],
            {
                func_name = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                return_type = luasnip.insert_node(3),
                body = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'funinl',
        fmta(
            [[
fun <func_name>(<parameters>): <return_type> = <body>
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
        'lambda',
        fmt(
            [[
val {lambda_name} = {{ {parameters} -> {body} }}
            ]],
            {
                lambda_name = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fungn',
        fmt(
            [[
fun <{generic_parameters}> {func_name}({parameters}): {return_type} {{
    {body}
}}{finish}
            ]],
            {
                generic_parameters = luasnip.insert_node(1),
                func_name = luasnip.insert_node(2),
                parameters = luasnip.insert_node(3),
                return_type = luasnip.insert_node(4),
                body = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                generic_parameters = luasnip.insert_node(1),
                func_name = luasnip.insert_node(2),
                parameters = luasnip.insert_node(3),
                return_type = luasnip.insert_node(4),
                where_clause = luasnip.insert_node(5),
                body = luasnip.insert_node(6),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'class',
        fmta(
            [[
class <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'classgn',
        fmt(
            [[
class {identifier}<{generic_parameters}> {{
    {field}
}}{finish}
            ]],
            {
                identifier = luasnip.insert_node(1),
                generic_parameters = luasnip.insert_node(2),
                field = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'classei',
        fmta(
            [[
class <identifier> : <class> {
    <field>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                class = luasnip.insert_node(2),
                field = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'interface',
        fmta(
            [[
interface <identifier>
{
    <field>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'interface',
        fmt(
            [[
interface {identifier}<{generic_parameters}> {{
    {field}
}}{finish}
            ]],
            {
                identifier = luasnip.insert_node(1),
                generic_parameters = luasnip.insert_node(2),
                field = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'enum',
        fmta(
            [[
enum class <identifier> {
    <field>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'dowhile',
        fmta(
            [[
do {
    <block>
} while (<statement>);
            ]],
            {
                statement = luasnip.insert_node(1),
                block = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'for',
        fmta(
            [[
for (<item> in <collection>) {
    <statement>
}<finish>
        ]],
            {
                item = luasnip.insert_node(1),
                collection = luasnip.insert_node(2),
                statement = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'while',
        fmta(
            [[
while (<condition>) {
    <statement>
}<finish>
        ]],
            {
                condition = luasnip.insert_node(1),
                statement = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

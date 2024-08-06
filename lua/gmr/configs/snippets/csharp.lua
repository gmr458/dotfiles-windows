local luasnip = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local filetype = 'cs'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if (<condition>)
{
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
else if (<condition>)
{
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
else
{
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
switch (<expression>)
{
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
        'switcht',
        fmta(
            [[
switch (true)
{
    <case>
}<finish>
            ]],
            {
                case = luasnip.insert_node(1),
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
    break;<finish>
            ]],
            {
                case = luasnip.insert_node(1),
                body_case = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
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
        'trycatch',
        fmta(
            [[
try
{
    <try_statements>
}
catch (<type_exception> <var_exception>)
{
    Console.WriteLine($"{e.Message}");
}<finish>
            ]],
            {
                try_statements = luasnip.insert_node(3),
                type_exception = luasnip.insert_node(1),
                var_exception = luasnip.insert_node(2),
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
catch (<type_exception> <var_exception>)
{
    <block>
    Console.WriteLine($"{e.Message}");
}<finish>
            ]],
            {
                type_exception = luasnip.insert_node(1),
                var_exception = luasnip.insert_node(2),
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
finally
{
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
try
{
    <try_statements>
}
catch (<type_exception> <var_exception>)
{
    <catch_statements>
    Console.WriteLine($"{e.Message}");
}
finally 
{
    <finally_statements>
}<finish>
            ]],
            {
                type_exception = luasnip.insert_node(1),
                var_exception = luasnip.insert_node(2),
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
        'function',
        fmta(
            [[
<return_type> <method_name>(<parameter_list>)
{
    <body>
}<finish>
            ]],
            {
                return_type = luasnip.insert_node(1),
                method_name = luasnip.insert_node(2),
                parameter_list = luasnip.insert_node(3),
                body = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'functiongn',
        fmt(
            [[
{return_type} {method_name}<{generic_parameter_list}>({parameter_list})
{{
    {body}
}}{finish}
            ]],
            {
                return_type = luasnip.insert_node(1),
                method_name = luasnip.insert_node(2),
                generic_parameter_list = luasnip.insert_node(3),
                parameter_list = luasnip.insert_node(4),
                body = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'functiongnwh',
        fmt(
            [[
{return_type} {method_name}<{generic_parameter_list}>({parameter_list}) where {where_clause}
{{
    {body}
}}{finish}
            ]],
            {
                return_type = luasnip.insert_node(1),
                method_name = luasnip.insert_node(2),
                generic_parameter_list = luasnip.insert_node(3),
                parameter_list = luasnip.insert_node(4),
                where_clause = luasnip.insert_node(5),
                body = luasnip.insert_node(6),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'struct',
        fmta(
            [[
struct <identifier>
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
        'class',
        fmta(
            [[
class <identifier>
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
        'classgn',
        fmt(
            [[
class {identifier}<{generic_parameters}>
{{
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
class <identifier> : <class>
{
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
        'enum',
        fmta(
            [[
enum <identifier>
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
        'dowhile',
        fmta(
            [[
do
{
    <block>
}
while (<statement>);
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
for (<initialization>; <condition>; <afterthought>)
{
    <statement>
}<finish>
        ]],
            {
                initialization = luasnip.insert_node(1),
                condition = luasnip.insert_node(2),
                afterthought = luasnip.insert_node(3),
                statement = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'foreach',
        fmta(
            [[
foreach (<type> <property> in <collection>) {
    <statement>
}<finish>
        ]],
            {
                type = luasnip.insert_node(1),
                property = luasnip.insert_node(2),
                collection = luasnip.insert_node(3),
                statement = luasnip.insert_node(4),
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
while (<condition>)
{
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

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'namespace',
        fmta(
            [[
namespace (<identifier>)
{
    <block>
}<finish>
        ]],
            {
                identifier = luasnip.insert_node(1),
                block = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'checked',
        fmta(
            [[
checked
{
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
        'unchecked',
        fmta(
            [[
unchecked
{
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
        'unsafe',
        fmta(
            [[
unsafe
{
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

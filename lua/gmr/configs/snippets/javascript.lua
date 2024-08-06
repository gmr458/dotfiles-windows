local luasnip = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local filetype = 'javascript'

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
        'switch',
        fmta(
            [[
switch (<expression>) {
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
switch (true) {
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
try {
    <try_statements>
} catch (err) {
    if (err instanceof Error) {
        console.error(err.message);
    }
}<finish>
            ]],
            {
                try_statements = luasnip.insert_node(1),
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
} catch (err) {
    if (err instanceof Error) {
        console.error(err.message);
    }
} finally {
    <finally_statements>
}<finish>
            ]],
            {
                try_statements = luasnip.insert_node(1),
                finally_statements = luasnip.insert_node(2),
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
function <func_name>(<parameters>) {
    <body>
}<finish>
            ]],
            {
                func_name = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                body = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'functiong',
        fmt(
            [[
function* {func_name}({parameters}) {{
    {body}
}}{finish}
            ]],
            {
                func_name = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                body = luasnip.insert_node(3),
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
        'classe',
        fmta(
            [[
class <identifier> extends <class> {
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
        'constructor',
        fmta(
            [[
constructor(<parameters>) {
    <block>
}<finish>
            ]],
            {
                parameters = luasnip.insert_node(1),
                block = luasnip.insert_node(2),
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
for (<initialization>; <condition>; <afterthought>) {
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
        'forin',
        fmta(
            [[
for (const <property> in <object>) {
    <statement>
}<finish>
        ]],
            {
                property = luasnip.insert_node(1),
                object = luasnip.insert_node(2),
                statement = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forof',
        fmta(
            [[
for (const <element> of <iterable>) {
    <statement>
}<finish>
        ]],
            {
                element = luasnip.insert_node(1),
                iterable = luasnip.insert_node(2),
                statement = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forofaw',
        fmta(
            [[
for await (const <element> of <iterable>) {
    <statement>
}<finish>
        ]],
            {
                element = luasnip.insert_node(1),
                iterable = luasnip.insert_node(2),
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

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'import',
        fmta(
            [[
import { <exported> } from "<module>";<finish>
            ]],
            {
                exported = luasnip.insert_node(2),
                module = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'importd',
        fmta(
            [[
import <default_export> from "<module>";<finish>
            ]],
            {
                default_export = luasnip.insert_node(2),
                module = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'require',
        fmta(
            [[
const { <exported> } = require("<module>");<finish>
            ]],
            {
                exported = luasnip.insert_node(2),
                module = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'required',
        fmta(
            [[
const <default_export> = require("<module>");<finish>
            ]],
            {
                default_export = luasnip.insert_node(2),
                module = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

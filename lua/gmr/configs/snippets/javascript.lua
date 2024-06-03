local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

local filetype = 'javascript'

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
        'switcht',
        fmta(
            [[
switch (true) {
    <case>
}<finish>
            ]],
            {
                case = insert_node(1),
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
    break;<finish>
            ]],
            {
                case = insert_node(1),
                body_case = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
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

luasnip.add_snippets(filetype, {
    snippet(
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
                try_statements = insert_node(1),
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
} catch (err) {
    if (err instanceof Error) {
        console.error(err.message);
    }
} finally {
    <finally_statements>
}<finish>
            ]],
            {
                try_statements = insert_node(1),
                finally_statements = insert_node(2),
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
function <func_name>(<parameters>) {
    <body>
}<finish>
            ]],
            {
                func_name = insert_node(1),
                parameters = insert_node(2),
                body = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'functiong',
        fmt(
            [[
function* {func_name}({parameters}) {{
    {body}
}}{finish}
            ]],
            {
                func_name = insert_node(1),
                parameters = insert_node(2),
                body = insert_node(3),
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
        'constructor',
        fmta(
            [[
constructor(<parameters>) {
    <block>
}<finish>
            ]],
            {
                parameters = insert_node(1),
                block = insert_node(2),
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
for (<initialization>; <condition>; <afterthought>) {
    <statement>
}<finish>
        ]],
            {
                initialization = insert_node(1),
                condition = insert_node(2),
                afterthought = insert_node(3),
                statement = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'forin',
        fmta(
            [[
for (const <property> in <object>) {
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
        'forof',
        fmta(
            [[
for (const <element> of <iterable>) {
    <statement>
}<finish>
        ]],
            {
                element = insert_node(1),
                iterable = insert_node(2),
                statement = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'forofaw',
        fmta(
            [[
for await (const <element> of <iterable>) {
    <statement>
}<finish>
        ]],
            {
                element = insert_node(1),
                iterable = insert_node(2),
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
        'import',
        fmta(
            [[
import { <exported> } from "<module>";<finish>
            ]],
            {
                exported = insert_node(2),
                module = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'importd',
        fmta(
            [[
import <default_export> from "<module>";<finish>
            ]],
            {
                default_export = insert_node(2),
                module = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'require',
        fmta(
            [[
const { <exported> } = require("<module>");<finish>
            ]],
            {
                exported = insert_node(2),
                module = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'required',
        fmta(
            [[
const <default_export> = require("<module>");<finish>
            ]],
            {
                default_export = insert_node(2),
                module = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

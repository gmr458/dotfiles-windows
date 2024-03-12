local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmta = require('luasnip.extras.fmt').fmta

local filetype = 'lua'

luasnip.add_snippets(filetype, {
    snippet(
        'if',
        fmta(
            [[
if <exp> then
    <block>
end<finish>
            ]],
            {
                exp = insert_node(1),
                block = insert_node(2),
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
elseif <exp> then
    <block>
            ]],
            {
                exp = insert_node(1),
                block = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'else',
        fmta(
            [[
else
    <block>
            ]],
            {
                block = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'repeat',
        fmta(
            [[
repeat
    <block>
until <exp>
            ]],
            {
                block = insert_node(0),
                exp = insert_node(1),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'while',
        fmta(
            [[
while <exp> do
    <block>
end<finish>
            ]],
            {
                exp = insert_node(1),
                block = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'forr',
        fmta(
            [[
for <var> = <val>, <limit> do
    <block>
end<finish>
            ]],
            {
                var = insert_node(1),
                val = insert_node(2),
                limit = insert_node(3),
                block = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'forrinc',
        fmta(
            [[
for <var> = <val>, <limit>, <step> do
    <block>
end<finish>
            ]],
            {
                var = insert_node(1),
                val = insert_node(2),
                limit = insert_node(3),
                step = insert_node(4),
                block = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'forpairs',
        fmta(
            [[
for <key>, <value> in pairs(<table>) do
    <block>
end<finish>
            ]],
            {
                key = insert_node(1),
                value = insert_node(2),
                table = insert_node(3),
                block = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'foripairs',
        fmta(
            [[
for <index>, <value> in ipairs(<table>) do
    <block>
end<finish>
            ]],
            {
                index = insert_node(1),
                value = insert_node(2),
                table = insert_node(3),
                block = insert_node(4),
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
function <func_name>(<parameters>)
    <body>
end<finish>
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
        'require',
        fmta(
            [[
require("<module>")<finish>
            ]],
            {
                module = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'print',
        fmta(
            [[
print("<str>")<finish>
            ]],
            {
                str = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

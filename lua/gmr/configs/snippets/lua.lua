local luasnip = require 'luasnip'
local fmta = require('luasnip.extras.fmt').fmta
local filetype = 'lua'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if <exp> then
    <block>
end<finish>
            ]],
            {
                exp = luasnip.insert_node(1),
                block = luasnip.insert_node(2),
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
elseif <exp> then
    <block>
            ]],
            {
                exp = luasnip.insert_node(1),
                block = luasnip.insert_node(0),
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
    <block>
            ]],
            {
                block = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'repeat',
        fmta(
            [[
repeat
    <block>
until <exp>
            ]],
            {
                block = luasnip.insert_node(0),
                exp = luasnip.insert_node(1),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'while',
        fmta(
            [[
while <exp> do
    <block>
end<finish>
            ]],
            {
                exp = luasnip.insert_node(1),
                block = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forr',
        fmta(
            [[
for <var> = <val>, <limit> do
    <block>
end<finish>
            ]],
            {
                var = luasnip.insert_node(1),
                val = luasnip.insert_node(2),
                limit = luasnip.insert_node(3),
                block = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forrinc',
        fmta(
            [[
for <var> = <val>, <limit>, <step> do
    <block>
end<finish>
            ]],
            {
                var = luasnip.insert_node(1),
                val = luasnip.insert_node(2),
                limit = luasnip.insert_node(3),
                step = luasnip.insert_node(4),
                block = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'forpairs',
        fmta(
            [[
for <key>, <value> in pairs(<table>) do
    <block>
end<finish>
            ]],
            {
                key = luasnip.insert_node(1),
                value = luasnip.insert_node(2),
                table = luasnip.insert_node(3),
                block = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'foripairs',
        fmta(
            [[
for <index>, <value> in ipairs(<table>) do
    <block>
end<finish>
            ]],
            {
                index = luasnip.insert_node(1),
                value = luasnip.insert_node(2),
                table = luasnip.insert_node(3),
                block = luasnip.insert_node(4),
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
function <func_name>(<parameters>)
    <body>
end<finish>
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
        'require',
        fmta(
            [[
require("<module>")<finish>
            ]],
            {
                module = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'print',
        fmta(
            [[
print("<str>")<finish>
            ]],
            {
                str = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

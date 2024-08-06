local luasnip = require 'luasnip'
local fmta = require('luasnip.extras.fmt').fmta
local filetype = 'python'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if <condition>:
    <body>
            ]],
            {
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(2),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'ifmain',
        fmta(
            [[
if __name__ == "__main__":
    <body>
            ]],
            {
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'elif',
        fmta(
            [[
elif <condition>:
    <body>
            ]],
            {
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(2),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'else',
        fmta(
            [[
else:
    <body>
            ]],
            {
                body = luasnip.insert_node(1),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'for',
        fmta(
            [[
for <condition> in <range>:
    <body>
            ]],
            {
                range = luasnip.insert_node(2),
                condition = luasnip.insert_node(1),
                body = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'def',
        fmta(
            [[
def <func_name>(<parameters>) <return_type>:
    <body>
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
        'import',
        fmta(
            [[
import <package>
            ]],
            {
                package = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'from',
        fmta(
            [[
from <module> import <exported>
            ]],
            {
                exported = luasnip.insert_node(0),
                module = luasnip.insert_node(1),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'class',
        fmta(
            [[
class <identifier>:
    <field>
            ]],
            {
                identifier = luasnip.insert_node(1),
                field = luasnip.insert_node(2),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'with',
        fmta(
            [[
with <resource> as <renamed>
            ]],
            {
                renamed = luasnip.insert_node(0),
                resource = luasnip.insert_node(1),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'tryexcept',
        fmta(
            [[
try:
    <try_statements>
except Exception as err:
    print(f"Error {err}, Type: {type(err)}")
            ]],
            {
                try_statements = luasnip.insert_node(1),
            }
        )
    ),
})

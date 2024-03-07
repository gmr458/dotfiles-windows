local luasnip = require 'luasnip'

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

local fmta = require('luasnip.extras.fmt').fmta
local fmt = require('luasnip.extras.fmt').fmt

local filetype = 'rust'

luasnip.add_snippets(filetype, {
    snippet(
        'fn',
        fmta(
            [[
fn <identifier>(<parameters>) <return_type> {
    <block_expression>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                parameters = insert_node(2),
                return_type = insert_node(3),
                block_expression = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fngn',
        fmt(
            [[
fn {identifier}<{type_parameters}>({parameters}) {return_type} {{
    {block_expression}
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                type_parameters = insert_node(2),
                parameters = insert_node(3),
                return_type = insert_node(4),
                block_expression = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fngnwh',
        fmt(
            [[
fn {identifier}<{type_parameters}>({parameters}) {return_type}
where
    {where_clause},
{{
    {block_expression}
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                type_parameters = insert_node(2),
                parameters = insert_node(3),
                return_type = insert_node(4),
                where_clause = insert_node(5),
                block_expression = insert_node(6),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'main',
        fmta(
            [[
fn main() {
    <block_expression>
}
            ]],
            {
                block_expression = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fn',
        fmta(
            [[
#[test]
fn <identifier>(<parameters>) {
    <block_expression>
}<finish>
            ]],
            {
                identifier = insert_node(1),
                parameters = insert_node(2),
                block_expression = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'derive',
        fmta(
            [[
#[derive(<trait>)]
            ]],
            {
                trait = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'struct',
        fmta(
            [[
struct <identifier> {
    <field>,
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
        'structgn',
        fmt(
            [[
struct {identifier}<{generic_parameters}> {{
    {field},
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
        'structgnwh',
        fmt(
            [[
struct {identifier}<{generic_parameters}>
where
    {where_clause},
{{
    {field},
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                generic_parameters = insert_node(2),
                where_clause = insert_node(3),
                field = insert_node(4),
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
    <field>,
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
        'enumgn',
        fmt(
            [[
enum {identifier}<{generic_parameters}> {{
    {field},
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
        'union',
        fmta(
            [[
union <identifier> {
    <field>,
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
        'trait',
        fmta(
            [[
trait <identifier> {
    <associated_item>,
}<finish>
            ]],
            {
                identifier = insert_node(1),
                associated_item = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'traitgn',
        fmt(
            [[
trait {identifier}<{generic_parameters}> {{
    {associated_item},
}}{finish}
            ]],
            {
                identifier = insert_node(1),
                generic_parameters = insert_node(2),
                associated_item = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'impl',
        fmta(
            [[
impl <type> {
    <associated_item>,
}<finish>
            ]],
            {
                type = insert_node(1),
                associated_item = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implgn',
        fmt(
            [[
impl<{generic_params_impl}> {type}<{generic_params_struct}> {{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = insert_node(1),
                type = insert_node(2),
                generic_params_struct = insert_node(3),
                associated_item = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implgnwh',
        fmt(
            [[
impl<{generic_params_impl}> {type}<{generic_params_struct}>
where
    {where_clause},
{{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = insert_node(1),
                type = insert_node(2),
                generic_params_struct = insert_node(3),
                where_clause = insert_node(4),
                associated_item = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implfor',
        fmta(
            [[
impl <trait> for <type> {
    <associated_item>,
}<finish>
            ]],
            {
                trait = insert_node(1),
                type = insert_node(2),
                associated_item = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implforgn',
        fmt(
            [[
impl<{generic_params_impl}> {trait}<{generic_params_struct}> for {type} {{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = insert_node(1),
                trait = insert_node(2),
                generic_params_struct = insert_node(3),
                type = insert_node(4),
                associated_item = insert_node(5),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'implforgnwh',
        fmt(
            [[
impl<{generic_params_impl}> {trait}<{generic_params_struct}> for {type}
where
    {where_clause},
{{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = insert_node(1),
                trait = insert_node(2),
                generic_params_struct = insert_node(3),
                type = insert_node(4),
                where_clause = insert_node(5),
                associated_item = insert_node(6),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'fnsgn',
        fmta(
            [[
fn <identifier>(<parameters>) <return_type>
            ]],
            {
                identifier = insert_node(1),
                parameters = insert_node(2),
                return_type = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'loop',
        fmta(
            [[
loop {
    <block_expression>
}<finish>
            ]],
            {
                block_expression = insert_node(1),
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
while <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = insert_node(1),
                block_expression = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'whilelet',
        fmta(
            [[
while let <pattern> = <scrutinee> {
    <block_expression>
}<finish>
            ]],
            {
                pattern = insert_node(1),
                scrutinee = insert_node(2),
                block_expression = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'for',
        fmta(
            [[
for <pattern> in <expression> {
    <block_expression>
}<finish>
            ]],
            {
                pattern = insert_node(1),
                expression = insert_node(2),
                block_expression = insert_node(3),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'if',
        fmta(
            [[
if <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = insert_node(1),
                block_expression = insert_node(2),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'iflet',
        fmta(
            [[
if let <pattern> = <scrutinee> {
    <block_expression>
} else {
    <block_else_expression>
}<finish>
            ]],
            {
                pattern = insert_node(1),
                scrutinee = insert_node(2),
                block_expression = insert_node(3),
                block_else_expression = insert_node(4),
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
else if <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = insert_node(1),
                block_expression = insert_node(2),
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
    <block_expression>
}<finish>
            ]],
            {
                block_expression = insert_node(1),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'matchop',
        fmt(
            [[
match {scrutinee_expression} {{
    Some({value}) => {pattern_guard_expression_some},
    None => {pattern_guard_expression_none},
}}{finish}
            ]],
            {
                scrutinee_expression = insert_node(1),
                value = insert_node(2),
                pattern_guard_expression_some = insert_node(3),
                pattern_guard_expression_none = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'matchopbl',
        fmt(
            [[
match {scrutinee_expression} {{
    Some({value}) => {{
        {pattern_guard_expression_block_some}
    }},
    None => {{
        {pattern_guard_expression_block_none}
    }},
}}{finish}
            ]],
            {
                scrutinee_expression = insert_node(1),
                value = insert_node(2),
                pattern_guard_expression_block_some = insert_node(3),
                pattern_guard_expression_block_none = insert_node(4),
                finish = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'dbg',
        fmta(
            [[
dbg!("<str>");
            ]],
            {
                str = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'print',
        fmta(
            [[
print!("<str>");
            ]],
            {
                str = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'println',
        fmta(
            [[
println!("<str>");
            ]],
            {
                str = insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    snippet(
        'format',
        fmta(
            [[
format!("<str>");
            ]],
            {
                str = insert_node(0),
            }
        )
    ),
})

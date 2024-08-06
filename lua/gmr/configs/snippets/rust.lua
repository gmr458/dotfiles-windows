local luasnip = require 'luasnip'
local fmta = require('luasnip.extras.fmt').fmta
local fmt = require('luasnip.extras.fmt').fmt
local filetype = 'rust'

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fn',
        fmta(
            [[
fn <identifier>(<parameters>) <return_type> {
    <block_expression>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                return_type = luasnip.insert_node(3),
                block_expression = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fngn',
        fmt(
            [[
fn {identifier}<{type_parameters}>({parameters}) {return_type} {{
    {block_expression}
}}{finish}
            ]],
            {
                identifier = luasnip.insert_node(1),
                type_parameters = luasnip.insert_node(2),
                parameters = luasnip.insert_node(3),
                return_type = luasnip.insert_node(4),
                block_expression = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                identifier = luasnip.insert_node(1),
                type_parameters = luasnip.insert_node(2),
                parameters = luasnip.insert_node(3),
                return_type = luasnip.insert_node(4),
                where_clause = luasnip.insert_node(5),
                block_expression = luasnip.insert_node(6),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'main',
        fmta(
            [[
fn main() {
    <block_expression>
}
            ]],
            {
                block_expression = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fn',
        fmta(
            [[
#[test]
fn <identifier>(<parameters>) {
    <block_expression>
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                block_expression = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'derive',
        fmta(
            [[
#[derive(<trait>)]
            ]],
            {
                trait = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'struct',
        fmta(
            [[
struct <identifier> {
    <field>,
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
        'structgn',
        fmt(
            [[
struct {identifier}<{generic_parameters}> {{
    {field},
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
                identifier = luasnip.insert_node(1),
                generic_parameters = luasnip.insert_node(2),
                where_clause = luasnip.insert_node(3),
                field = luasnip.insert_node(4),
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
enum <identifier> {
    <field>,
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
        'enumgn',
        fmt(
            [[
enum {identifier}<{generic_parameters}> {{
    {field},
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
        'union',
        fmta(
            [[
union <identifier> {
    <field>,
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
        'trait',
        fmta(
            [[
trait <identifier> {
    <associated_item>,
}<finish>
            ]],
            {
                identifier = luasnip.insert_node(1),
                associated_item = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'traitgn',
        fmt(
            [[
trait {identifier}<{generic_parameters}> {{
    {associated_item},
}}{finish}
            ]],
            {
                identifier = luasnip.insert_node(1),
                generic_parameters = luasnip.insert_node(2),
                associated_item = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'impl',
        fmta(
            [[
impl <type> {
    <associated_item>,
}<finish>
            ]],
            {
                type = luasnip.insert_node(1),
                associated_item = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'implgn',
        fmt(
            [[
impl<{generic_params_impl}> {type}<{generic_params_struct}> {{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = luasnip.insert_node(1),
                type = luasnip.insert_node(2),
                generic_params_struct = luasnip.insert_node(3),
                associated_item = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                generic_params_impl = luasnip.insert_node(1),
                type = luasnip.insert_node(2),
                generic_params_struct = luasnip.insert_node(3),
                where_clause = luasnip.insert_node(4),
                associated_item = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'implfor',
        fmta(
            [[
impl <trait> for <type> {
    <associated_item>,
}<finish>
            ]],
            {
                trait = luasnip.insert_node(1),
                type = luasnip.insert_node(2),
                associated_item = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'implforgn',
        fmt(
            [[
impl<{generic_params_impl}> {trait}<{generic_params_struct}> for {type} {{
    {associated_item},
}}{finish}
            ]],
            {
                generic_params_impl = luasnip.insert_node(1),
                trait = luasnip.insert_node(2),
                generic_params_struct = luasnip.insert_node(3),
                type = luasnip.insert_node(4),
                associated_item = luasnip.insert_node(5),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                generic_params_impl = luasnip.insert_node(1),
                trait = luasnip.insert_node(2),
                generic_params_struct = luasnip.insert_node(3),
                type = luasnip.insert_node(4),
                where_clause = luasnip.insert_node(5),
                associated_item = luasnip.insert_node(6),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'fnsgn',
        fmta(
            [[
fn <identifier>(<parameters>) <return_type>
            ]],
            {
                identifier = luasnip.insert_node(1),
                parameters = luasnip.insert_node(2),
                return_type = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'loop',
        fmta(
            [[
loop {
    <block_expression>
}<finish>
            ]],
            {
                block_expression = luasnip.insert_node(1),
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
while <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = luasnip.insert_node(1),
                block_expression = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'whilelet',
        fmta(
            [[
while let <pattern> = <scrutinee> {
    <block_expression>
}<finish>
            ]],
            {
                pattern = luasnip.insert_node(1),
                scrutinee = luasnip.insert_node(2),
                block_expression = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'for',
        fmta(
            [[
for <pattern> in <expression> {
    <block_expression>
}<finish>
            ]],
            {
                pattern = luasnip.insert_node(1),
                expression = luasnip.insert_node(2),
                block_expression = luasnip.insert_node(3),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'if',
        fmta(
            [[
if <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = luasnip.insert_node(1),
                block_expression = luasnip.insert_node(2),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                pattern = luasnip.insert_node(1),
                scrutinee = luasnip.insert_node(2),
                block_expression = luasnip.insert_node(3),
                block_else_expression = luasnip.insert_node(4),
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
else if <expression> {
    <block_expression>
}<finish>
            ]],
            {
                expression = luasnip.insert_node(1),
                block_expression = luasnip.insert_node(2),
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
    <block_expression>
}<finish>
            ]],
            {
                block_expression = luasnip.insert_node(1),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'matchop',
        fmt(
            [[
match {scrutinee_expression} {{
    Some({value}) => {pattern_guard_expression_some},
    None => {pattern_guard_expression_none},
}}{finish}
            ]],
            {
                scrutinee_expression = luasnip.insert_node(1),
                value = luasnip.insert_node(2),
                pattern_guard_expression_some = luasnip.insert_node(3),
                pattern_guard_expression_none = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
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
                scrutinee_expression = luasnip.insert_node(1),
                value = luasnip.insert_node(2),
                pattern_guard_expression_block_some = luasnip.insert_node(3),
                pattern_guard_expression_block_none = luasnip.insert_node(4),
                finish = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'dbg',
        fmta(
            [[
dbg!("<str>");
            ]],
            {
                str = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'print',
        fmta(
            [[
print!("<str>");
            ]],
            {
                str = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'println',
        fmta(
            [[
println!("<str>");
            ]],
            {
                str = luasnip.insert_node(0),
            }
        )
    ),
})

luasnip.add_snippets(filetype, {
    luasnip.snippet(
        'format',
        fmta(
            [[
format!("<str>");
            ]],
            {
                str = luasnip.insert_node(0),
            }
        )
    ),
})

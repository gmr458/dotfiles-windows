(macro_invocation
    macro: (scoped_identifier
        path: (identifier) @_path (#eq? @_path "sqlx")
        name: (identifier) @_name (#eq? @_name "query")
    )
    (token_tree
        (raw_string_literal) @sql
    )
)

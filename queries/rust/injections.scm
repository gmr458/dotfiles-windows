; Highlight SQL code inside string

; Rust code example with raw string literal
; sqlx::query!(
;     r#"
;         SELECT * FROM tasks
;         WHERE id = $1
;         ORDER BY $2
;     "#,
;     id,
;     order_by
; )
(macro_invocation
    macro: (scoped_identifier
        path: (identifier) @_path (#eq? @_path "sqlx")
        name: (identifier) @_name (#eq? @_name "query")
    )
    (token_tree
        (raw_string_literal) @sql
    )
)

; Highlight SQL code inside raw string literal
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

; ----------------------------------------------------------

; Highlight SQL code inside string literal
; Rust code example with string literal
; sqlx::query!("SELECT * FROM tasks")
(macro_invocation
    macro: (scoped_identifier
        path: (identifier) @_path (#eq? @_path "sqlx")
        name: (identifier) @_name (#eq? @_name "query")
    )
    (token_tree
        (string_literal) @sql
    )
)

; ----------------------------------------------------------

; Highlight HTML code inside raw string literal
; Rust code example with raw string literal
; HttpResponse::Ok()
;         .content_type(ContentType::html())
;         .body(format!(
;             r#"
;                 <!DOCTYPE html>
;                 <html lang="en">
;                     <head>
;                         <meta http-equiv="content-type" content="text/html; charset=utf-8">
;                         <title>Login</title>
;                     </head>
;                     <body>
;                         <h1>Hello World!</h1>
;                     </body>
;                 </html>
;             "#,
;         ))
(call_expression
    function: (field_expression
        value: (call_expression
            function: (field_expression
                value: (call_expression
                    function: (scoped_identifier
                        path: (identifier) @_HttpResponse (#eq? @_HttpResponse "HttpResponse")
                    )
                )
                field: (field_identifier) @_content_type (#eq? @_content_type "content_type")
            )
            arguments: (arguments
                (call_expression
                    function: (scoped_identifier
                        path: (identifier) @_ContentType (#eq? @_ContentType "ContentType")
                        name: (identifier) @_html (#eq? @_html "html")
                    )
                )
            )
        )
        field: (field_identifier) @_body (#eq? @_body "body")
    )
    arguments: (arguments
        (macro_invocation
            macro: (identifier) @_format (#eq? @_format "format")
            (token_tree
                (raw_string_literal) @html
            )
        )
    )
)

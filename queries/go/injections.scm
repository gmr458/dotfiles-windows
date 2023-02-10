; Highlight SQL code inside string

; Go code example with interpreted string literal
; rows, err := db.Query("SELECT * FROM tasks")
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Query")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; rows, err := db.Query(`SELECT * FROM tasks`)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Query")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; rows, err := db.QueryContext(ctx, "SELECT * FROM tasks")
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryContext")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; rows, err := db.QueryContext(ctx, `SELECT * FROM tasks`)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryContext")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; row := db.QueryRow("SELECT * FROM tasks WHERE id = ?", id)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryRow")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; row := db.QueryRow(`SELECT * FROM tasks WHERE id = ?`, id)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryRow")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; row := db.QueryRowContext(ctx, "SELECT * FROM tasks WHERE id = ?", id)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryRowContext")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; row := db.QueryRowContext(ctx, "SELECT * FROM tasks WHERE id = ?", id)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "QueryRowContext")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; stmt, err = db.Prepare("SELECT * FROM tasks")
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Prepare")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; stmt, err = db.Prepare(`SELECT * FROM tasks`)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Prepare")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; stmt, err = db.PrepareContext("SELECT * FROM tasks")
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "PrepareContext")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; stmt, err = db.PrepareContext(`SELECT * FROM tasks`)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "PrepareContext")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; result, err = db.Exec("INSERT INTO tasks (title, description) VALUES (?, ?)", title, description)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Exec")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; result, err = db.Exec(`INSERT INTO tasks (title, description) VALUES (?, ?)`, title, description)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "Exec")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; result, err = db.ExecContext(ctx, "INSERT INTO tasks (title, description) VALUES (?, ?)", title, description)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "ExecContext")
    )
    arguments: (argument_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; result, err = db.ExecContext(ctx, `INSERT INTO tasks (title, description) VALUES (?, ?)`, title, description)
(call_expression
    function: (selector_expression
        field: (field_identifier) @_field (#eq? @_field "ExecContext")
    )
    arguments: (argument_list
        (raw_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal and type identifier
; const query string = "SELECT * FROM tasks"

; Go code example with interpreted string literal without type identifier
; const query = "SELECT * FROM tasks"
(const_declaration
    (const_spec
        name: (identifier) @name (#eq? @name "query")
        (expression_list
            (interpreted_string_literal) @sql
        )
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal and type identifier
; const query string = `SELECT * FROM tasks`

; Go code example with raw string literal without type identifier
; const query = `SELECT * FROM tasks`
(const_declaration
    (const_spec
        name: (identifier) @name (#eq? @name "query")
        (expression_list
            (raw_string_literal) @sql
        )
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; query := fmt.Sprintf("UPDATE task SET %s = ? WHERE id = ?", field)
(short_var_declaration
    left: (expression_list) @_left (#eq? @_left "query")
    right: (expression_list
        (call_expression
            function: (selector_expression
                operand: (identifier) @_operand (#eq? @_operand "fmt")
                field: (field_identifier) @_field (#eq? @_field "Sprintf")
            )
            arguments: (argument_list
                (interpreted_string_literal) @sql
            )
        )
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; query := fmt.Sprintf(`UPDATE task SET %s = ? WHERE id = ?`, field)
(short_var_declaration
    left: (expression_list) @_left (#eq? @_left "query")
    right: (expression_list
        (call_expression
            function: (selector_expression
                operand: (identifier) @_operand (#eq? @_operand "fmt")
                field: (field_identifier) @_field (#eq? @_field "Sprintf")
            )
            arguments: (argument_list
                (raw_string_literal) @sql
            )
        )
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal and type identifier
; var query string = fmt.Sprintf("UPDATE task SET %s = ? WHERE id = ?", field)

; Go code example with interpreted string literal and without type identifier
; var query = fmt.Sprintf("UPDATE task SET %s = ? WHERE id = ?", field)
(var_declaration
    (var_spec
        name: (identifier) @_name (#eq? @_name "query")
        value: (expression_list
            (call_expression
                function: (selector_expression
                    operand: (identifier) @_operand (#eq? @_operand "fmt")
                    field: (field_identifier) @_field (#eq? @_field "Sprintf")
                )
                arguments: (argument_list
                    (interpreted_string_literal) @sql
                )
            )
        )
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal and type identifier
; var query string = fmt.Sprintf(`UPDATE task SET %s = ? WHERE id = ?`, field)

; Go code example with raw string literal and without type identifier
; var query = fmt.Sprintf(`UPDATE task SET %s = ? WHERE id = ?`, field)
(var_declaration
    (var_spec
        name: (identifier) @_name (#eq? @_name "query")
        value: (expression_list
            (call_expression
                function: (selector_expression
                    operand: (identifier) @_operand (#eq? @_operand "fmt")
                    field: (field_identifier) @_field (#eq? @_field "Sprintf")
                )
                arguments: (argument_list
                    (raw_string_literal) @sql
                )
            )
        )
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal and type identifier:
; var query string = "SELECT * FROM tasks"

; Go code example with interpreted string literal and without type identifier:
; var query = "SELECT * FROM tasks"
(var_declaration
    (var_spec
        name: (identifier) @_name (#eq? @_name "query")
        value: (expression_list
            (interpreted_string_literal) @sql
        )
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal and type identifier:
; var query string = `SELECT * FROM tasks`

; Go code example with raw string literal and without type identifier:
; var query = `SELECT * FROM tasks`
(var_declaration
    (var_spec
        name: (identifier) @_name (#eq? @_name "query")
        value: (expression_list
            (raw_string_literal) @sql
        )
    )
)

; ----------------------------------------------------------------

; Go code example with interpreted string literal
; query := "SELECT * FROM tasks"
(short_var_declaration
    left: (expression_list) @_left (#eq? @_left "query")
    right: (expression_list
        (interpreted_string_literal) @sql
    )
)

; ----------------------------------------------------------------

; Go code example with raw string literal
; query := `SELECT * FROM tasks`
(short_var_declaration
    left: (expression_list) @_left (#eq? @_left "query")
    right: (expression_list
        (raw_string_literal) @sql
    )
)

; Highlight SQL code inside string

; Python code example
; connection = get_mysql_connection()
; with connection.cursor() as cursor:
;     cursor.execute(
;         """INSERT INTO post (title, body, author_id)
;             VALUES (%s, %s, %s)""",
;         (title, body, user_id),
;     )
; connection.commit()

(call
    (attribute
        attribute: (identifier) @_attribute (#eq? @_attribute "execute")
    )
    (argument_list
        (string) @sql
    )
)

(call
    (attribute
        attribute: (identifier) @_attribute (#eq? @_attribute "execute")
    )
    (argument_list
        (concatenated_string) @sql
    )
)

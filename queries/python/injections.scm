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

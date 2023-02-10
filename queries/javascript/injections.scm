(call_expression
    (member_expression
        property: (property_identifier) @_property (#eq? @_property "query")
    )
    (arguments
        (string) @sql
    )
)

(call_expression
    (member_expression
        property: (property_identifier) @_property (#eq? @_property "query")
    )
    (arguments
        (template_string) @sql
    )
)

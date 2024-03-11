; extends

(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|select|INSERT|insert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
    (#set! injection.language "sql")
)

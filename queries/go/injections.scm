; extends

; SQL syntax highlighting within strings (NVIM v0.9.4)
; (
;     [
;         (interpreted_string_literal)
;         (raw_string_literal)
;     ] @sql
;     (#match? @sql "(SELECT|select|INSERT|insert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
;     (#offset! @sql 0 1 0 -1)
; )

; SQL syntax highlighting within strings (NVIM v0.10.0)
(
    [
        (raw_string_literal)
        (interpreted_string_literal)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

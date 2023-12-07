; extends

; SQL syntax highlighting within strings (NVIM v0.9.4)
; (
;     [
;         (string)
;     ] @sql
;     (#match? @sql "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
;     (#offset! @sql 0 1 0 -1)
; )

; SQL syntax highlighting within strings (NVIM v0.10.0)
(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

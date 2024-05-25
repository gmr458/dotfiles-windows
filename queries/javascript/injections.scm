; extends

(
    [
        (string_fragment)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE).+(FROM|INTO|VALUES|SET|TABLE).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

(
    [
        (template_string)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE).+(FROM|INTO|VALUES|SET|TABLE).*(WHERE|GROUP BY)?")
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")
)

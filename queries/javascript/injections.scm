; extends

(
    [
        (string_fragment)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE).+(FROM|INTO|VALUES|SET|TABLE).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)

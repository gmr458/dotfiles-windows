; extends

(
  [
    (string)
  ] @sql
  (#match? @sql "(SELECT|select|INSERT|insert|UPDATE|update|DELETE|delete).+(FROM|from|INTO|into|VALUES|values|SET|set).*(WHERE|where|GROUP BY|group by)?")
  (#offset! @sql 0 1 0 -1)
)

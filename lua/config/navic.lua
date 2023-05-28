local ok, navic = pcall(require, "nvim-navic")
if not ok then
  vim.notify("nvim-navic could not be loaded")
  return
end

navic.setup({
  icons = {
    File = "file ",
    Module = "module ",
    Namespace = "namespace ",
    Package = "package ",
    Class = "class ",
    Method = "method ",
    Property = "property ",
    Field = "field ",
    Constructor = "constructor ",
    Enum = "enum ",
    Interface = "interface ",
    Function = "function ",
    Variable = "variable ",
    Constant = "constant ",
    String = "string ",
    Number = "number ",
    Boolean = "boolean ",
    Array = "array ",
    Object = "object ",
    Key = "key ",
    Null = "null ",
    EnumMember = "enum member ",
    Struct = "struct ",
    Event = "event ",
    Operator = "operator ",
    TypeParameter = "type parameter ",
  },
  highlight = true,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
})

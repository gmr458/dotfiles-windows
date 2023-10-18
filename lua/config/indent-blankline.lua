local ok, ibl = pcall(require, "ibl")
if not ok then
  vim.notify("indent_blankline could not be loaded")
  return
end

ibl.setup({
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    include = {
      node_type = {
        lua = {
          "table_constructor",
        },
        go = {
          "import_spec_list",
          "field_declaration_list",
          "literal_value",
          "interface_type",
          "var_declaration",
          "const_declaration",
        },
        rust = {
          "field_initializer_list",
        },
        javascript = {
          "parenthesized_expression",
          "object",
        },
        python = {
          "argument_list",
          "list",
          "import_from_statement",
          "parenthesized_expression",
          "if_statement",
          "for_statement",
          "try_statement",
        },
      },
    },
    exclude = {
      language = { "toml", "yaml" },
    },
  },
  indent = {
    char = "│",
  },
})

local config = {
  filetypes = {
    "django-html",
    "ejs",
    "handlebars",
    "hbs",
    "html",
    "htmldjango",
    "less",
    "pug",
  },
  -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
  init_options = {
    html = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
  },
}

return config

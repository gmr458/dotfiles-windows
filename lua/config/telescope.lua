local ok, telescope, actions_layout

ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope could not be loaded")
  return
end

ok, actions_layout = pcall(require, "telescope.actions.layout")
if not ok then
  vim.notify("telescope could not be loaded")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<C-y>"] = actions_layout.toggle_preview,
      },
      i = {
        ["<C-y>"] = actions_layout.toggle_preview,
      },
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    multi_icon = "",
    sorting_strategy = "ascending",
    layout_strategy = nil,
    layout_config = nil,
    borderchars = {
      "─",
      "│",
      "─",
      "│",
      "┌",
      "┐",
      "┘",
      "└",
    },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  pickers = {
    buffers = {
      previewer = false,
      layout_config = {
        width = 0.7,
        prompt_position = "top",
      },
    },
    builtin = {
      previewer = false,
      layout_config = {
        width = 0.3,
        prompt_position = "top",
      },
    },
    find_files = {
      previewer = false,
      layout_config = {
        width = 0.7,
        prompt_position = "top",
      },
    },
    help_tags = {
      layout_config = {
        prompt_position = "top",
        scroll_speed = 4,
        height = 0.9,
        width = 0.9,
        preview_width = 0.55,
      },
    },
    live_grep = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_implementations = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    lsp_references = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = false,
      },
    },
    oldfiles = {
      previewer = false,
      layout_config = {
        width = 0.9,
        prompt_position = "top",
      },
    },
  },
})

if not require("config.utils").running_android() then
  telescope.load_extension("fzf")
end

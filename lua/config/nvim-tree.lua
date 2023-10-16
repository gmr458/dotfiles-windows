local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree could not be loaded")
  return
end

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  view = { width = {} },
  renderer = {
    highlight_git = false,
    root_folder_label = function(path)
      local root_folder = vim.fn.fnamemodify(path, ":t")
      return string.upper(root_folder)
    end,
    indent_markers = {
      enable = true,
      inline_arrows = true,
    },
    icons = {
      show = { folder_arrow = false },
      symlink_arrow = " 󰁔 ",
      glyphs = {
        bookmark = "󰆤",
        modified = "",
        folder = {
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "M",
          staged = "A",
          unmerged = "UM",
          renamed = "R",
          untracked = "U",
          deleted = "D",
          ignored = "",
        },
      },
    },
    special_files = {},
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { "^\\.git$" },
    exclude = {},
  },
  modified = { enable = true },
  git = { enable = true },
})

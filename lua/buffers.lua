require("bufferline").setup {
    highlights = {
        buffer_selected = {
            gui = "NONE"
        }
    },
    options = {
        offsets = {{
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory"
        }}
    }
}

require("formatter").setup({
    logging = false,
    filetype = {
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        }
    }
})

vim.cmd("nnoremap <silent> <leader>pyf :Format<CR>")

local saga = require("lspsaga")

saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    code_action_icon = ' ',
    rename_prompt_prefix = ""
}

-- use default config
saga.init_lsp_saga()

-- Code Action
vim.cmd("nnoremap <silent><leader>ca :Lspsaga code_action<CR>")
vim.cmd("vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>")

-- Hover Doc
vim.cmd("nnoremap <silent>K :Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- Signature Help
vim.cmd("nnoremap <silent> gs :Lspsaga signature_help<CR>")

-- Rename
vim.cmd("nnoremap <silent>gr :Lspsaga rename<CR>")

-- Preview Definition
vim.cmd("nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>")

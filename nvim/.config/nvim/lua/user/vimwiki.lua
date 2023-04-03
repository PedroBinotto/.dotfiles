local cmd = [[
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = { 'python': 'python', 'java': 'java', 'kotlin': 'kotlin', 'c++': 'cpp', 'c': 'c' }
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0
]]

vim.cmd(cmd)

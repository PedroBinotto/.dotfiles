local wiki_path = '~/vimwiki/'
local html_path = '~/Documents/vimwiki/html/'
local converter = 'custom_converter.py'
local nested_syntaxes = {
  python = 'python',
  java = 'java',
  kotlin = 'kotlin',
  ['c++'] = 'cpp',
  c = 'c',
}

vim.g.vimwiki_list = {
  {
    path = wiki_path,
    path_html = html_path,
    syntax = 'markdown',
    custom_wiki2html = wiki_path .. converter,
    ext = '.md',
  }
}
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_nested_syntaxes = nested_syntaxes

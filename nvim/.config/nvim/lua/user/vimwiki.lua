local wiki_path = '~/vimwiki/'
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
    syntax = 'markdown',
    ext = '.md',
  }
}
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_nested_syntaxes = nested_syntaxes

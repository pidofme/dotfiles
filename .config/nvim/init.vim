"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示行号
set number
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>
"用<F3>开启NERD tree插件浏览文件
noremap <F3> <ESC>:NERDTree<CR>
"指定列高亮
set colorcolumn=80
"高亮光标所在行
set cursorline
"高亮光标所在列
set cursorcolumn

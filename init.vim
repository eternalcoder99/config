"|  \/  |_   _| \ | |_   _(_)_ __ ___
"| |\/| | | | |  \| \ \ / / | '_ ` _ \ 
"| |  | | |_| | |\  |\ V /| | | | | | |
"|_|  |_|\__, |_| \_| \_/ |_|_| |_| |_|
"        |___/
"Author: kite
"Date: 2020年9月22日 11:26
"Email: 987324339@qq.com

" ===== base setting =====
let mapleader=" "
set encoding=utf-8
set autochdir
set number
set hidden
set listchars=trail:▫
set list

"支持彩色
set termguicolors

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" ===== indent setting =======
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set laststatus=2
set clipboard=unnamedplus
set encoding=utf-8

set spell
set number
set relativenumber
set cursorline
set ruler
set wrap
set showcmd
set wildmenu
set scrolloff=10

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===== split ===========
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

" ===== create split ======
map <UP> :resize -5<CR>
map <DOWN> :resize +5<CR>
map <left> :vertical resize -5<CR>
map <RIGHT> :vertical resize +5<CR>

" ===== split move =======
map mj <C-w>h
map mk <C-w>j
map mi <C-w>k
map ml <C-w>l

" ===== buffer =========
map te :tabe<CR>
map tn :tabnext<CR>
map tu :-tabnext<CR>
map tc :tabclose<CR>

" ===== key bind =======
noremap j h
noremap k j
noremap i k
noremap l l
noremap u i
noremap h u
noremap , ^
noremap . $
map tx :r !figlet

" ==== special ======
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'mhinz/vim-startify'
Plug 'ajmwagar/vim-deus'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'chrisbra/changesPlugin'
Plug 'liuchengxu/eleline.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'zerodragon/onehalfdark'

" ale
Plug 'dense-analysis/ale'


" rnvimr
Plug 'kevinhwang91/rnvimr'

" coc
Plug 'neoclide/coc.nvim'

" vista
Plug 'liuchengxu/vista.vim'

" xtabline
Plug 'mg979/vim-xtabline'

" fzf
Plug 'junegunn/fzf.vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode'

" import cost
Plug 'yardnsm/vim-import-cost'

" todo-height
" Plug 'vim-todo-highlight'

" undotree
Plug 'mbbill/undotree'

" vim-man
Plug 'vim-utils/vim-man'

" nerd commenter
Plug 'preservim/nerdcommenter'

" ultisnips
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" pairs
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'


" indent
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine', { 'for': ['python'] }

" fix space
Plug 'bronson/vim-trailing-whitespace'

" vim-autopep8
Plug 'tell-k/vim-autopep8'

" goyo
Plug 'junegunn/goyo.vim'

" vim-wakatime
Plug 'wakatime/vim-wakatime'

"vim-less
Plug 'groenewege/vim-less'


" vim-translate
" Plug 'voldikss/vim-translator'
Plug 'iamcco/dict.vim'

" debuger
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-python --enable-go --enable-bash' }

" coc-highlight
Plug 'neoclide/coc-highlight'

" vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" html
"Plug 'mattn/emmet-vim'

call plug#end()


source ~/.config/nvim/coc.vim

" scheme
colorscheme deus
" colorscheme onehalfdark

" jslint
let g:JSLintHighlightErrorLine = 0


" ale
let g:ale_lint_on_text_changed       = 'normal'                     "代码更改后启动检查
let g:ale_lint_on_insert_leave       = 1                            "退出插入模式即检查
let g:ale_sign_column_always         = 1                            "总是显示动态检查结果
let g:ale_sign_error                 = '>>'                         " error告警符号
let g:ale_sign_warning               = '--'                         "warning 告警符号
let g:ale_echo_msg_error_str         = 'E'                          "错误显示字符
let g:ale_echo_msg_warning_str       = 'W'                          "警告显示字符
let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]' "告警显示格式

" C 语言配置检查参数
let g:ale_c_gcc_options              = '-Wall -Werror -O2 -std=c11'
let g:ale_c_clang_options            = '-Wall -Werror -O2 -std=c11'
let g:ale_c_cppcheck_options         = ''
" C++ 配置检查参数
let g:ale_cpp_gcc_options            = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_clang_options          = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_cppcheck_options       = ''

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
     \   'c++': ['clang', 'gcc'],
     \   'c': ['clang', 'gcc'],
     \   'python': ['pylint'],
     \}
" <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>
"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap ak <Plug>(ale_previous_wrap)
nmap aj <Plug>(ale_next_wrap)
" ad 查看错误或警告的详细信息
nmap ad :ALEDetail<CR>

" coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-explorer
nmap tt :CocCommand explorer<CR>

" rnvimr
map rt :RnvimrToggle<CR>

" find file
noremap \ :FZF<CR>
" find history
noremap <C-h> :MRU<CR>
" find lines containing keywords
noremap <C-l> :LinesWithPreview<CR>
" find buffer
noremap <C-b> :Buffers<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --sort'}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())

" pair
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['gray',        'RoyalBlue3'],
    \ ]
let g:rbpt_max = 16   " 开启16对括号匹配
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces"

noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'cpp'
      set splitbelow
      exec "!g++ -std=c++11 % -Wall -o %<"
      :sp
      :res -15
      :term ./%<
    elseif &filetype == 'java'
      exec "!javac % -d ~/appcation/java/out"
      exec "!time java % -s ~/appcation/java/out"
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      set splitbelow
      :sp
      :term python3 %
    elseif &filetype == 'html'
        silent! exec "!google-chrome-stable % &"
    elseif &filetype == 'tex'
      silent! exec "VimtexStop"
      silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
      exec "CocCommand flutter.run -d ".g:flutter_default_device
      silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
      set splitbelow
      :sp
      :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
      set splitbelow
      :sp
      :term go run .
    endif
endfunc

" fix space
nmap <leader>, :FixWhitespace<CR>


" vista
nmap T :Vista<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

" ultisnips
"let g:UltiSnipsExpandTrigger="<C-e>"
"let g:UltiSnipsJumpForwardTrigger="<C-e>"
"let g:UltiSnipsJumpBackwardTrigger="<C-w>"
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']

" undo
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 0
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
  nmap <buffer> u <plug>UndotreeNextState
  nmap <buffer> e <plug>UndotreePreviousState
  nmap <buffer> U 5<plug>UndotreeNextState
  nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

nmap <leader>gy :Goyo<CR>

" 自动添加文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java exec ":call SetTitle()"
func SetTitle()
  " sh
  if &filetype == 'sh'
    call setline(1,"\#!/bin/bash")
    call append(line("."),"\#########################################################################")
    call append(line(".")+1, "\# File Name: ".expand("%"))
    call append(line(".")+2, "\# Author : Mahavairocana")
    call append(line(".")+3, "\# QQ : 987324339")
    call append(line(".")+4, "\# Email:987324339@qq.com")
    call append(line(".")+5, "\# Created Time: ".strftime("%c"))
    call append(line(".")+6, "\#####################################################################")
  elseif &filetype == 'python'
    call setline(1,"\#!/usr/bin/env python")
    call append(line("."),"\#########################################################################")
    call append(line(".")+1, "\# -*- coding: utf-8 -*-")
    call append(line(".")+2, "\# File Name: ".expand("%"))
    call append(line(".")+3, "\# Author :kite")
    call append(line(".")+4, "\# QQ : 987324339")
    call append(line(".")+5, "\# Email:987324339@qq.com")
    call append(line(".")+6, "\# Created Time: ".strftime("%c"))
    call append(line(".")+7, "\#########################################################################")
  else
    call setline(1, "/**")
    call append(line("."), "  * File Name: ".expand("%"))
    call append(line(".")+1, "  * Author : kite")
    call append(line(".")+2, "  * QQ : 987324339")
    call append(line(".")+3, "  * Created Time: ".strftime("%c"))
    call append(line(".")+4, "  * Email:987324339@qq.com")
    call append(line(".")+5, "**/")
  endif
  if &filetype == 'cpp'
    call append(line(".")+6, "#include <iostream>")
    call append(line(".")+7, "using namespace std;")
  endif
  if &filetype == 'c'
    call append(line(".")+6, "#include <stdio.h>")
  endif
endfunc
autocmd BufNewFile * normal G

" vim-man
map <leader>v <Plug>(Vman)
map <leader>k <Plug>(Man)

" vim-autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
let g:autopep8_pep8_passes=100
let g:autopep8_max_line_length=79
let g:autopep8_disable_show_diff=1
"let g:autopep8_indent_size=2
let g:autopep8_diff_type='horizontal'
let g:autopep8_on_save = 1

" vim-todo-height
let g:todo_highlight_disable_default = ['TODO', 'FIXME']
let g:todo_highlight_config = {
      \   'REVIEW': {},
      \   'NOTE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#ffbd2a',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   }
      \ }

" markdown-preview
map <leader>v :MarkdownPreview<CR>
map <leader>d :MarkdownPreviewStop<CR>
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" vim-table-mode
map <leader>tm :TableModeEnable<CR>

" changesplug
let g:changes_autocmd = 1
let g:changes_diff_preview = 0
let g:changes_respect_SignColumn = 1
let g:changes_sign_text_utf8 = 0
let g:changes_use_icons = 1

" tabnine-vim
"set rtp+=~/application/tabnine-vim

" vim-translate
nmap <silent> <C-t> <Plug>DictWSearch
vmap <silent> <C-t> <Plug>DictWVSearch
nmap <silent> <C-r> <Plug>DictRSearch
vmap <silent> <C-r> <Plug>DictRVSearch

" coc-snippets
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" 关闭插件默认映射
let g:multi_cursor_use_default_mapping = 0
" mapping
let g:multi_cursor_start_word_key      = '<C-d>'	" 选中一个
let g:multi_cursor_select_all_word_key = '<A-n>'	" 全选匹配的字符
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'	" 回到上一个
let g:multi_cursor_skip_key            = '<C-x>'	" 跳过当前选中, 选中下一个
let g:multi_cursor_quit_key            = '<Esc>'	" 退出


" vim-less
nnoremap <Leader>l :w <BAR> !lessc % > %:t:r.css<CR><space>

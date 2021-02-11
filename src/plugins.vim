call plug#begin()
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/clever-f.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'yuttie/comfortable-motion.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'cocopon/iceberg.vim'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plug 'puremourning/vimspector'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-lion'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-sandwich'
Plug 'mg979/vim-visual-multi'
call plug#end()


" Iceberg
set termguicolors
colorscheme iceberg
" end


" Fzf
nnoremap <silent> <leader>ss yiw:Ag <c-r>"<cr>
nnoremap <silent> <leader>sd :Files<cr>
nnoremap <silent> <leader>sc :GFiles?<cr>
nnoremap <silent> <leader>sf yiw:Ag<cr>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS = '-m --bind ctrl-a:select-all,ctrl-d:deselect-all'
" end


" NerdTree
let g:NERDTreeMinimalUI              = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeWinPos                 = 'right'
let g:nerdtree_sync_cursorline       = 1
let g:NERDTreeStatusline             = '%#NonText#'
let g:NERDTreeAutoDeleteBuffer       = 1
let g:NERDTreeQuitOnOpen             = 1
let g:NERDTreeMouseMode              = 3

hi NERDTreeDir      ctermfg=white
hi NERDTreeExecFile ctermfg=white
hi NERDTreeOpenable ctermfg=white
hi NERDTreeClosable ctermfg=white
hi NERDTreeFlags    ctermfg=12 guifg=#6a6c6c

au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

fun! ToggleNERDTree()
    " {{{
    :NERDTreeToggle
    :NERDTreeRefreshRoot
    if(exists("b:NERDTreeType") == 1)
        call feedkeys("R")
    endif
endfun

let g:NERDTreeGitStatusIndicatorMapCustom = {
            \  'Modified'  :'M', 'Staged'    :'S', 'Untracked' :'U',
            \  'Deleted'   :'D', 'Dirty'     :'*', 'Renamed'   :'R'
            \}
" }}}

nnoremap <silent> <leader>n :call ToggleNERDTree()<cr>
" end


" Blamer
let g:blamer_enabled              = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_delay                = 200
" end


" Ale
let g:ale_sign_error              = '✘'
let g:ale_sign_warning            = '⚬'
let g:ale_linters_explicit        = 1

let g:ale_linters = {
            \  'python': ['flake8', 'pylint'],
            \  'javascript': ['eslint'],
            \  'javascriptreact': ['eslint'],
            \  'typescript': ['eslint'],
            \  'typescriptreact': ['eslint'],
            \}

let g:ale_fixers = {
            \  '*': ['trim_whitespace'],
            \  'python': ['isort', 'autopep8'],
            \  'javascript': ['prettier'],
            \  'javascriptreact': ['prettier'],
            \  'typescript': ['eslint', 'tslint'],
            \  'typescriptreact': ['eslint'],
            \  'markdown': ['prettier'],
            \}

let g:ale_python_flake8_options       = '--ignore=E501,W504'
let g:ale_python_autopep8_options     = '--max-line-length 120'
let g:ale_javascript_prettier_options = '--single-quote --print-width=140 --arrow-parens=always --trailing-comma=es5 --implicit-arrow-linebreak=beside'

hi link ALEWarning CursorLineNr
hi link ALEError ALEWarning
hi clear ALEErrorSign
hi clear ALEWarningSign
" end


" Semshi
hi semshiSelected ctermbg=242 guifg=#b7bdc0 guibg=#474646
hi link semshiUnresolved ALEWarning
" end


" Coc
let g:coc_global_extensions = [
            \  'coc-tsserver',
            \  'coc-python',
            \]

nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-rename)
nmap <silent> coc :CocCommand<cr>

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

fun! s:show_documentation()
    " {{{
    if (index(['vim','help'], &filetype) >= 0)
        exe 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfun
" }}}

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<cr>"
else
    inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
endif
" end


" BufTabline
let g:buftabline_indicators    = 1
" end


" Auto Pairs
let g:AutoPairsMultilineClose  = 0
" end


" Visual Multi
let g:VM_maps                       = {}
let g:VM_maps["Select Cursor Down"] = '<a-m>'
let g:VM_maps["Select Cursor Up"]   = '<a-M>'
let g:VM_Mono_hl                    = 'StatusLine'
let g:VM_Cursor_hl                  = 'StatusLine'
let g:VM_Extend_hl                  = 'StatusLine'
let g:VM_Insert_hl                  = 'StatusLine'
let g:VM_highlight_matches          = ''
" end


" Clever F
let g:clever_f_mark_char_color = 'PmenuSel'
" end


" Git Gutter
let g:gitgutter_sign_added              = '▌'
let g:gitgutter_sign_modified           = '▌'
let g:gitgutter_sign_removed            = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed   = '▌'

hi GitGutterAdd          guibg=bg
hi GitGutterChange       guibg=bg
hi GitGutterDelete       guibg=bg
hi GitGutterChangeDelete guibg=bg
"  end


" Sandwich
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:sandwich#recipes = [
            \ {'buns': ["(", ")"], 'nesting': 1, 'match_syntax': 1, 'input': ['('] },
            \ {'buns': ["[", "]"], 'nesting': 1, 'match_syntax': 1, 'input': ['['] },
            \ {'buns': ["{", "}"], 'nesting': 1, 'match_syntax': 1, 'input': ['{'] },
            \ {'buns': ["<", ">"], 'nesting': 1, 'match_syntax': 1, 'input': ['<'] },
            \ {'buns': ["( ", " )"], 'nesting': 1, 'match_syntax': 1, 'input': [')'] },
            \ {'buns': ["[ ", " ]"], 'nesting': 1, 'match_syntax': 1, 'input': [']'] },
            \ {'buns': ["{ ", " }"], 'nesting': 1, 'match_syntax': 1, 'input': ['}'] },
            \ {'buns': ["< ", " >"], 'nesting': 1, 'match_syntax': 1, 'input': ['>'] },
            \ ]
silent! nmap <unique> ca <Plug>(operator-sandwich-add)
silent! xmap <unique> ca <Plug>(operator-sandwich-add)
silent! omap <unique> ca <Plug>(operator-sandwich-g@)
nmap cr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap cr <Plug>(operator-sandwich-replace)
nmap cd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap cd <Plug>(operator-sandwich-delete)
" end


" Indent Line
let g:indentLine_char         = '▏'
let g:indentLine_color_gui = '#3B4252'
" end


" Conflict Marker
let g:conflict_marker_begin           = '^<<<<.\+'
let g:conflict_marker_end             = '^>>>>.\+'
let g:conflict_marker_enable_mappings = 0

hi ConflictMarkerBegin     ctermfg=195 ctermbg=30 guifg=#c6c8d1 guibg=#5b7881
hi ConflictMarkerEnd       ctermfg=255 ctermbg=240 guifg=#eff0f4 guibg=#5b6389
hi ConflictMarkerSeparator guifg=#272c42
hi ConflictMarkerOurs      ctermfg=159   ctermbg=23 guifg=#b3c3cc guibg=#384851
hi ConflictMarkerTheirs    ctermbg=236   guibg=#3d425b

nnoremap <leader>ho :ConflictMarkerOurselves<cr>
nnoremap <leader>ht :ConflictMarkerThemselves<cr>
nnoremap <leader>hb :ConflictMarkerBoth<cr>
nnoremap <leader>hB :ConflictMarkerBoth!<cr>
nnoremap <leader>hn :ConflictMarkerNone<cr>
" end


" Git Plugins
nnoremap ]c :ConflictMarkerNextHunk<cr>:GitGutterNextHunk<cr>:echo ''<cr>
nnoremap [c :ConflictMarkerPrevHunk<cr>:GitGutterPrevHunk<cr>:echo ''<cr>

fun! DisablePluginsOnMerge()
    " {{{
    if filereadable(expand('%:p')) && match(readfile(expand('%:p')), g:conflict_marker_begin) != -1
        let g:indentLine_enabled = 0
        let g:ale_set_highlights = 0
        let g:can_auto_save = 0
    else
        let g:indentLine_enabled = 1
        let g:ale_set_highlights = 1
        let g:can_auto_save = 1
    endif
endfun
" }}}

au BufRead,BufEnter * :call DisablePluginsOnMerge()
" end


" Highlight
hi TabLineSel  cterm=bold   gui=bold guifg=#D8DEE9 ctermfg=none ctermbg=none guibg=bg
hi TabLine     ctermbg=none guibg=bg
hi TabLineFill guifg=bg

hi LineNr     ctermbg=bg  guibg=bg
hi SignColumn ctermbg=bg  guibg=bg
hi VertSplit  guifg=bg    guibg=bg
hi FoldColumn guibg=bg
hi Folded     ctermfg=0   guifg=#3B4252   guibg=#2E3440 ctermfg=none  ctermbg=none guibg=bg
hi Pmenu      guibg=bg

hi DiffAdd    ctermfg=159 ctermbg=23  guifg=#b3c3cc guibg=#384851
hi DiffDelete ctermbg=224 ctermfg=224 guifg=#53343b guibg=#53343b
"  end


" Vimspector
" let g:vimspector_enable_mappings = 'HUMAN'

" nmap <leader>vl :call vimspector#Launch()<cr>
" nmap <leader>vr :VimspectorReset<cr>
" nmap <leader>ve :VimspectorEval
" nmap <leader>vw :VimspectorWatch
" nmap <leader>vo :VimspectorShowOutput
" end

" Plugins
" put a 'on': [] in {} if you want to temporarily disable a plugin
call plug#begin(stdpath('data') . '/plugged')
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} "
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'Chiel92/vim-autoformat'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'morhetz/gruvbox'
call plug#end()

" set leader to space (make sure this is above anything that uses leader)
let mapleader = " "

" find files
nn <silent><C-p> :Files<cr>

" fuzzy find op
nn <silent><leader>r :Rg<cr>
nn <silent><leader>f :BLines<cr>

" make fullscreen
nn <C-w>f :tab split<cr>

" better tabbing
vn > >gv
vn < <gv

"copy/paste clipboard
nn <leader>y ggVG"+y

" move to end of paste or yank
vn <silent> y y`]
vn <silent> p p`]
nn <silent> p p`]

" sudo write
cmap w!! w !sudo tee % > /dev/null

" number lines; replace after = with value you want
" vnoremap <silent> <Leader>n :<C-U>let i=1 \| '<,'>g/^/s//\=nr2char(i+64) . '. '/ \| let i=i+1 \| nohl<CR>
vn <silent> <Leader>n :<C-u> let i=1 \| '<,'>g/^/s//\=i . '. '/ \| let i=i+1 \| nohl<CR>

" very magic by default
nno ? ?\v
nno / /\v

" check maps
nn <leader>m :verbose map

" save fast
nn <leader>w :w<cr>

" quit fast
nn <silent> <leader>q :q<cr>

" suspend vim
nn <C-f> :sus<CR>

" edit snippets fast
nn <silent> <leader>u :UltiSnipsEdit<cr>

" edit vimrc
nn <silent> <leader>e :vs $MYVIMRC<cr>

" reload vimrc
nn <silent> <leader>v :source $MYVIMRC<cr>

" stop highlighting searches
nn <silent> <leader>h :nohl<cr>

" command mode for easier editing
nn q; q:

" always append to end of line
nn a A

" who uses ; anyway
nn ; :
vn ; :

" go to beginning/end of line
nn H ^
nn L g$
nn cL c$
nn dL d$
nn yL y$
vn H 0
vn L $

" move by visual line
nn j gj
nn k gk

" prevent single character deletion from overwriting yank register
nn x "_x

" shift selection up and down in a pretty way
vn J :m '>+1<CR>gv=gv
vn K :m '<-2<CR>gv=gv

fun! s:join_spaceless()
    exe 'normal! gJ'
    " Remove character under the cursor if it's whitespace.
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        exe 'normal! dw'
    endif
endfun

" Map it to a key
nn J :call <SID>join_spaceless()<CR>

aug disable_comments
    au!
    au FileType matlab setlocal commentstring=%\ %s
    au FileType vim setlocal formatoptions-=c fo-=r fo-=o
aug END

" aug save_file
"     au!
"     " save file on insertion
"     au InsertLeave * :write
"     " save file on creation
"     au BufNewFile * :write
" aug END

" rust format on save
" augroup RustFormat
"     au!
"     au BufWrite *.rs :Autoformat
" augroup END

" highlight currently selected line
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END

" allow truecolor
set termguicolors

" offset scrolling by 2 lines [surround] this
set scrolloff=2

" indent when wrapping runover lines
set breakindent

set formatoptions=l

" visually break lines on words
set linebreak

" enable spellchecking
set spell
setlocal spell spelllang=en_us
ino <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" show effects of commands in real time
set inccommand=nosplit

" copy indent from last line when starting new line
set autoindent
filetype plugin indent on

" lazy redraw
set lazyredraw

" at start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set smarttab

" change timeout delay for exiting modes (https://www.johnhawthorn.com/2012/09/vi-escape-delays/)
set timeoutlen=1000
set ttimeoutlen=10

" intuitive splits
set splitright
set splitbelow

" case-insensitive completion (e.g. :Colors)
set ignorecase
" show line numbers on the side
set number

" relative line numbers
set relativenumber

" enable mouse usage in terminals
set mouse=a

" show the keys being typed
set showcmd

" lightline shows mode
set noshowmode

" no sounds
set noerrorbells

" no visual warnings
set novisualbell

" enable syntax highlighting
syntax enable

" tabs are just spaces
set expandtab

" tabs are 4 spaces
set tabstop=4

" using > goes 4 spaces
set shiftwidth=4

" permanent undo
set undodir=~/.vimdid
set undofile

" hide tildes for empty lines (https://github.com/neovim/neovim/issues/2067)
let &fcs='eob: '

" hide startup message
set shortmess+=I

" 80 char max
set colorcolumn=80

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" autopairs config
let g:AutoPairsShortcutJump = '<C-n>'
" vimtex config
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

" ultisnips config
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="vertical"

" easymotion config
" disable default mappings
let g:EasyMotion_do_mapping = 0
nm s <Plug>(easymotion-overwin-f)

" turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" markdown preview options
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
            \ 'content_editable': v:false
            \ }

" colorscheme
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
set background=dark

" lightline config
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ }

" coc configuration
" " TextEdit might fail if hidden is not set.
set hidden

" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" " Give more space for displaying messages.
set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
set signcolumn=yes
" transparency
" hi Normal guibg=NONE ctermbg=NONE

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
ino <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
ino <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

fun! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfun

" Use <c-space> to trigger completion.
ino <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
ino <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nm <silent> [g <Plug>(coc-diagnostic-prev)
nm <silent> ]g <Plug>(coc-diagnostic-next)

" go to definition
nm <silent> gd <Plug>(coc-definition)

nm <silent> gy <Plug>(coc-type-definition)
nm <silent> gi <Plug>(coc-implementation)
nm <silent> gr <Plug>(coc-references)

" show documentation
nn <silent> K :call <SID>show_documentation()<CR>

fun! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfun

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" Formatting selected code.

" Update signature help on jump placeholder.
au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xm if <Plug>(coc-funcobj-i)
xm af <Plug>(coc-funcobj-a)
om if <Plug>(coc-funcobj-i)
om af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nn <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

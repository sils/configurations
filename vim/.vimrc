set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number " Line numbers
set ignorecase
set hlsearch " Highlight searches
set title
set ruler " Have a ruler with number of chars in the line below
set laststatus=2
set showmatch " Show matching brackets
syntax on " Syntax highlighting
" Commit messages:
au FileType gitcommit set tw=72

" Highlight trailing spaces
match Error "\s\+$"

" Show tabs as '>---'
set list
set listchars=tab:>-

let c_space_errors = 1
let java_space_errors = 1
" Vala things
let vala_comment_strings = 1
let vala_space_errors = 1 " Highlight space errors

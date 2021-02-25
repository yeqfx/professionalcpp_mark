se nocp		" set nocompatible : vi와 호환모드를 해제하고 Vim의 향상된(Improved) 기능을 사용할 수 있게 한다.
syntax on	" 문법 표시를 사용한다. syntax enable과 같다. 비활성화는 syntax off 또는 syntax clear
se nu		" set number : 화면에 행번호를 표시한다.

""""""""""""""""""""""
" Vundle Setting
""""""""""""""""""""""

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'

call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""
" Indent Setting
""""""""""""""""""""""
se ai		" set autoindent : 자동 들여쓰기를 사용한다. 새 행의 들여쓰기를 이전행의 들여쓰기와 동일하게 맞춰준다.
se cindent	" C언어 스타일의 들여쓰기를 사용한다.

""""""""""""""""""""""
" Tab Setting
""""""""""""""""""""""
se ts=4		" set tabstop : 탭 크기를 지정한다. 탭 하나를 몇 개의 공백으로 표시할지 결정한다. 기본값은 8.
se sts=4	" softtabstop 
se sw=4		" set shiftwidth : cindent를 설정한 다음 블록을 시작할 때 자동으로 들여쓰는 열의 너비를 설정한다.
se et		" expandtab : Tab을 space로 설정한다.
se tw=0		" set textwidth : 편집할 화면의 열 길이를 정한다(0이면 비활성화).
se ru		" set ruler : 오른쪽 아래에 현재 위치를 표시한다.

"""""""""""""""""""""
" Search Setting
"""""""""""""""""""""
se ignorecase	" 검색시 대소문자 구별
se smartcase	
se hls			" set hlsearch : 하이라이트로 검색어를 강조한다.
se is			" set incsearch : 

"""""""""""""""""""""
" Encoding Setting
"""""""""""""""""""""
se fencs=ucs-bom,utf-8,korea
se fenc=utf-8


set scrolloff=2
set wildmode=longest,list



set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴

set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기

set showmatch " 일치하는 괄호 하이라이팅

set smarttab
set smartindent




set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif



" 컬러 스킴 사용
set termguicolors
let g:gruvbox_contrast_dark="hard"
set background=dark
autocmd vimenter * colorscheme gruvbox

" Smarter tab line 활성화: 모든 파일 버퍼 출력
let g:airline#extensions#tabline#enabled = 1

" Tab line 구분자 '|' 로 설정
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Powerline-font 활성화
let g:airline_powerline_fonts = 1 

" colorscheme jellybeans

" Clipboard
set clipboard=unnamedplus
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

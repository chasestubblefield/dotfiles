" .vimrc

set nocompatible

filetype plugin indent on

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set showcmd
set ruler
set number
set ttimeoutlen=100
set wildmenu

" color
syntax enable
silent! colorscheme smyck

let mapleader = ","

map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>

" edit .vimrc
map <leader>v :e $MYVIMRC<cr>

" scroll through buffers
map <leader><tab> :bnext<cr>
map <leader><s-tab> :bprevious<cr>

" show invisibles
map <leader>l :set list!<cr>

" highlight current line
map <leader>L :set cursorline!<cr>

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! ClearExec(cmd)
  exec ":!clear; " . a:cmd
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '\.feature$') != -1
    call ClearExec("bundle exec cucumber " . a:filename)
  else " assume rspec
    if filereadable("bin/rspec")
      call ClearExec("./bin/rspec " . a:filename)
    elseif filereadable("Gemfile")
      call ClearExec("bundle exec rspec " . a:filename)
    else
      call ClearExec("rspec " . a:filename)
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  if match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  call RunTestFile(":" . line('.'))
endfunction

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

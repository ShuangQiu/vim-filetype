" Vim syntax file
" Language:	Cadence cds*.lib assura*.lib file
" Maintainer:	Xiangyu Xu
" Last Change:  05/15/2017	
"
" This is based on following versions.
"
" http://gist.github.com/02015678/cddcac5ea9aba201343d3ef455092b04
" http://github.com/peter-d/dotfiles/blob/master/.vim/syntax/cdslib.vim
" http://github.com/realpsyence/dotfiles/blob/master/.vim/syntax_hmm/cdslib.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" cdslib syntax is case INsensitive
syn case ignore
setlocal iskeyword=@,48-57,_

syn keyword	cdslibTodo	contained TODO XXX FIXME NOTE

" Main statements
"===============================================
syn keyword     cdslibStatement       DEFINE SOFTDEFINE nextgroup=cdslibLib skipwhite
syn region      cdslibLib start="\S" end="\s" skipwhite contained keepend nextgroup=cdslibArg

syn keyword     cdslibStatement       INCLUDE SOFTINCLUDE UNDEFINE nextgroup=cdslibArg skipwhite
syn region      cdslibArg start="\S" end="$" skipwhite contained keepend contains=cdslibVar

syn region cdslibComment  start=/#/ end=/$/ contains=cdslibTodo display oneline
"syn region cdslibString   start=/"/ end=/"/ contains=cdslibVar contained
"syn region cdslibString   start=/'/ end=/'/ contains=cdslibVar contained
syn match  cdslibVar      "\$\%(\k\+\|\d\)"

syn region cdslibComment start="/\*" end="\*/" contains=cdslibTodo

"syn keyword cdslibStatement   ASSIGN 

" Misc
"=====
syn match   cdslibWrapLineOperator       "\\$"
syn match   cdslibIgnore		  "\ \ \ "

syn match   cdsLibname    "^[ \t]*\(DEFINE\|UNDEFINE\)[ \t]\+[a-zA-Z_][a-zA-Z_0-9]*[ \t]*" contains=cdsKeyword
syn match   cdsComment    "^--.*$"

syn match   cdslibStatement      "^ \=\.\I\+"
syn region  cdslibString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+

syn region cdslibComment start="--" end="$" contains=cdslibTodo
syn region cdslibComment start="#" end="$" contains=cdslibTodo

" Matching pairs of parentheses
"==========================================
syn region  cdslibParen transparent matchgroup=cdslibOperator start="(" end=")" contains=ALLBUT,cdslibParenError
syn region  cdslibSinglequote matchgroup=cdslibOperator start=+'+ end=+'+ oneline

" Errors
"=======
syn match cdslibParenError ")"

" Syncs
" =====
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cdslib_syntax_inits")
  if version < 508
    let did_cdslib_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cdslibTodo	         Todo
  HiLink cdslibWrapLineOperator cdslibOperator
  HiLink cdslibSinglequote      cdslibExpr
  HiLink cdslibExpr             Function
  HiLink cdslibParenError       Error
  HiLink cdslibStatement        Statement
  HiLink cdslibNumber           Number
  HiLink cdslibComment          Comment
  HiLink cdslibOperator         Operator
  HiLink cdslibString           String
  HiLink cdslibKeyword          Type 
  HiLink cdslibIgnore		 Ignore

  delcommand HiLink
endif

if !exists("did_cdslib_syntax_inits")
  let did_cdslib_syntax_inits = 1
  highlight link cdsComment           Comment
  highlight link cdsKeyword           Keyword
  highlight link cdsLibname           Defined
endif

let b:current_syntax = "cdslib"

" vim: ts=8

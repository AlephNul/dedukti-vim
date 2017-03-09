" Vim syntax file
" Language: Dedukti
" Maintainer: Antoine Defourné
" Latest Revision: 08/03/2017

if exists('b:current_syntax')
	finish
endif

setlocal iskeyword=a-z,A-Z,48-57,_,!,?,'

syntax case match

syntax keyword dkKeyword def
syntax keyword dkTypeCst Type
syntax keyword dkTodo TODO Todo todo contained

syntax match dkCommand
	\ '\v#(NAME|WHNF|HNF|SNF|STEP|CONV|CHECK|INFER|PRINT)'

syntax region dkComment contains=dkTodo
	\ start=+\v\(;+ end=+\v;\)+
syntax region dkContext contains=dkIdentifier matchgroup=dkOperator
	\ start=+\v\[+ end=+\v\]+

" The crazy pattern below matches identifiers with optional prefixes
" and said prefixes when they are present.
syntax match dkModName '\v\w+(\.\w)@=' contained
syntax match dkIdentifier '\v(\w+\.)?\w\k*' contains=dkModName

syntax match dkOperator '\M-->'
syntax match dkOperator '\M->'
syntax match dkOperator '\M=>'
syntax match dkOperator '\M:'
syntax match dkOperator '\M:='
syntax match dkOperator '\M.\w\@!'

syntax match dkImplicitArg '\v<_>'

highlight link dkKeyword Keyword
highlight link dkTypeCst Constant
highlight link dkTodo Todo
highlight link dkCommand PreProc
highlight link dkComment Comment
highlight link dkOperator Operator
highlight link dkImplicitArg Special
" Leave identifiers blank; there are so many of them.
highlight link dkModName Identifier

let b:current_syntax = 'dedukti'

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'menhir'
elseif exists("b:current_syntax") && b:current_syntax == "menhir"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword MenhirCommentTodo      TODO FIXME XXX TBD contained
syn match   MenhirLineComment      "#.*" contains=@Spell,MenhirCommentTodo
syn match   MenhirSpecial	       "\\\d\d\d\|\\."
syn region  MenhirString	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=MenhirSpecial,@htmlPreproc
syn region  MenhirEmbed	       start=+${+  end=+}+	contains=@MenhirEmbededExpr

syn match   MenhirSpecialCharacter "'\\.'"
syn match   MenhirNumber           "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match   MenhirNumber           "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match   MenhirNumber           "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match   MenhirNumber           "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match   MenhirNumber           "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match   MenhirNumber           "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match   MenhirNumber           "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match   MenhirNumber           "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"

syn match   MenhirOperators        "+"
syn match   MenhirOperators        "-"
syn match   MenhirOperators        "*"
syn match   MenhirOperators        "/"
syn match   MenhirOperators        "%"
syn match   MenhirOperators        "=="
syn match   MenhirOperators        "!="
syn match   MenhirOperators        ">="
syn match   MenhirOperators        ">"
syn match   MenhirOperators        "<"
syn match   MenhirOperators        "<="
syn match   MenhirOperators        "&&"
syn match   MenhirOperators        "||"
syn match   MenhirOperators        "!"
syn match   MenhirOperators        "?"
syn match   MenhirOperators        "->"
syn match   MenhirOperators        "="
syn match   MenhirOperators        "&"


syn keyword MenhirConditional	if else match
syn keyword MenhirRepeat	while for in
syn keyword MenhirBranch	break
syn keyword MenhirOperator	new delete as  
syn keyword MenhirType		int uint i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 string void bool
syn keyword MenhirDeclaration   type interface import extern implements
syn keyword MenhirStatement	return self var let
syn keyword MenhirBoolean	true false
syn keyword MenhirNull		null nil
syn match   MenhirGenericType   "$\h\w*"
syn match   MenhirIdentifier	"\h\w*"
syn cluster MenhirEmbededExpr	contains=MenhirBoolean,MenhirNull,MenhirIdentifier,MenhirString

syn keyword MenhirFn	        fn nextgroup=MenhirFunction skipwhite
syn match   MenhirFunction	"\~\?\h\(\w\|\.\)*" display contained
syn keyword MenhirTypeDec       enum struct nextgroup=MenhirTypeName skipwhite
syn match   MenhirTypeName      "\h\w*" display contained
syn match   ReturnTypeStart     "->" nextgroup=ReturnType skipwhite
syn match   ReturnType          ".*[^:]" display contained
syn match   MenhirCompilerCall        "@\h\w*"
syn match   MenhirBraces	   "[{}\[\]]"
syn match   MenhirParens	   "[()]"

if main_syntax == "menhir"
  syn sync fromstart
  syn sync maxlines=100

  syn sync ccomment MenhirComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link MenhirDeclaration           Keyword 
hi def link MenhirComment		Comment
hi def link MenhirLineComment		Comment
hi def link MenhirCommentTodo		Todo
hi def link MenhirSpecial		Special
hi def link MenhirString		String
hi def link MenhirCharacter		Character
hi def link MenhirSpecialCharacter	MenhirSpecial
hi def link MenhirNumber		Number
hi def link MenhirConditional		Conditional
hi def link MenhirRepeat		Repeat
hi def link MenhirBranch		Conditional
hi def link MenhirOperator		Operator
hi def link MenhirOperators		Operator
hi def link MenhirType			Type
hi def link MenhirGenericType           Type
hi def link MenhirStatement		Statement
hi def link MenhirError		        Error
hi def link MenhirNull			Keyword
hi def link MenhirBoolean		Boolean
hi def link MenhirIdentifier		Identifier
hi def link MenhirEmbed		        Special
hi def link MenhirFn                    Keyword
hi def link MenhirFunction              Function
hi def link MenhirBraces                Delimiter
hi def link MenhirParens                Delimiter 
hi def link MenhirTypeDec               Keyword
hi def link MenhirTypeName              Structure
hi def link ReturnTypeStart             Special 
hi def link ReturnType                  Type
hi def link MenhirCompilerCall          Function


let b:current_syntax = "menhir"
if main_syntax == 'menhir'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

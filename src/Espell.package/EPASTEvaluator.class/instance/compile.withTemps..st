compiling
compile: aString withTemps: someTemps
	| ast  compilationContext |
	ast := self parse: aString.
	compilationContext := self class compiler compilationContext.
	compilationContext class: (codeProvider classNamed: #ProtoObject).
	compilationContext requestor: (EPCompilationRequestor withTemps: someTemps).
	ast methodNode doSemanticAnalysisInContext: compilationContext.
	^ ast
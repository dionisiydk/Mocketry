tests
testCapturingArgument

	mock stub someMessageWith: Arg argName.
	
 	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue
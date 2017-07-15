printing
stringForSpecTitle
	returnedMock isGhost ifFalse: [ ^returnedMock stringForSpecValidation]. "it is possible that mock was converted into normal object like boolean or number due to boolean logic or arithmetic operations which happens with returned mock"
	
	^'default mock(' , returnedMock ghostIdentityHash asString , ')'
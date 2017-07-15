tests
testFetchingNameFromInstanceVariableName
	| actual | 
	actual := mock mockName.
		
	actual should equal: 'mock'
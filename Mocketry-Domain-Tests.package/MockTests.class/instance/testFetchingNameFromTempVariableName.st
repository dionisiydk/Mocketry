tests
testFetchingNameFromTempVariableName
	| actual tempMock | 
	tempMock := Mock new.
	
	actual := tempMock mockName.
		
	actual should equal: 'tempMock'
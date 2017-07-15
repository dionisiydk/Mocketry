tests
testInstVarMockHasSameBehaviourAsTempMock
	| mock2 | 
	mock2 := Mock new.
	
	mock ghostBehaviour should be: mock2 ghostBehaviour
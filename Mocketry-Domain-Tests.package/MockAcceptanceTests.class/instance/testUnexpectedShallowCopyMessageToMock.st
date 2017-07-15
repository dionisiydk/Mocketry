tests
testUnexpectedShallowCopyMessageToMock

	| actual |			
	actual := mock shallowCopy.
	
	actual should beInstanceOf: MockForMessageReturn.
	actual ghostBehaviour should be: mock ghostBehaviour.
	actual mockOwnerMessage selector should be: #shallowCopy
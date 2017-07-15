tests
testUnexpectedCopyMessageToMock

	| actual |			
	actual := mock copy.
	
	actual should beInstanceOf: MockForMessageReturn.
	actual ghostBehaviour should be: mock ghostBehaviour.
	actual mockOwnerMessage selector should be: #copy
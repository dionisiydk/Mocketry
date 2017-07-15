tests
testUnexpectedMessageDefinedOnObjectWhichDefaultMethodFailed

	| actual |	
	[ Object new at: 500 ] should fail.
	actual := mock at: 500.
	
	actual should beInstanceOf: MockForMessageReturn.
	MockCurrentBehaviour value occurredMessages should haveSize: 1
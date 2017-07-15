tests
testGettingStub

	| actual stubBehaviour |
	actual := mock stub.
	
	actual should beInstanceOf: MockHelper.
	stubBehaviour := actual ghostBehaviour.
	stubBehaviour should beInstanceOf: MockBehaviour.
	stubBehaviour where mockRole should beInstanceOf: MockStubTeacher.
	stubBehaviour where mockRole object should be: mock.
	stubBehaviour where expectedMessages should be: mock ghostBehaviour expectedMessages.
	stubBehaviour where ownerEnvironment should be: mock ghostBehaviour ownerEnvironment.
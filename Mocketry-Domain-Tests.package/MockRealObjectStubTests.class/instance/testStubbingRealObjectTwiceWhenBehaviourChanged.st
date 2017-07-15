tests
testStubbingRealObjectTwiceWhenBehaviourChanged

	| rect firstStub secondStub |
	rect := 0@0 corner: 2@3.
	
	firstStub := rect stub.
	
	MockCurrentBehaviour value: nil.

	secondStub := rect stub.

	firstStub ghostBehaviour expectedMessages should be: secondStub ghostBehaviour expectedMessages
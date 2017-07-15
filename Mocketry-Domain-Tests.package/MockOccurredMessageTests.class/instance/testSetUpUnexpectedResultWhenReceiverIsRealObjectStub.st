tests
testSetUpUnexpectedResultWhenReceiverIsRealObjectStub

	| message actual rect |
	rect := 0@0 corner: 2@3.
	rect stub.
	
	message := MockOccurredMessage receiver: rect selector: #area.
	
	actual := message setUpUnexpectedResult.
	
	actual should equal: 6.
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: 6
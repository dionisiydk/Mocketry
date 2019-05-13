tests
testValidationThatObjectIsResultOfDeepMessageSendWhichWasAlsoReturnedFromSender

	| result rect |
	rect := 0@0 corner: mock.
	rect stub.
	
	result := rect right.
	
	result should beReturnedFrom: [mock x].
	result should beReturnedFrom: [rect right].
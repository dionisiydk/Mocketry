tests
testValidationThatObjectIsResultOfParticularMessageSend

	| result |
	result := mock someMessage.
	
	result should beReturnedFrom: [mock someMessage].
	result should not beReturnedFrom: [mock someMessage2].
tests
testValidationThatObjectPropertyIsResultOfParticularMessageSend

	| result ownerObject |
	result := mock someMessage.

	ownerObject := Array with: result.
		
	ownerObject where first should beReturnedFrom: [mock someMessage].
	ownerObject where first should not beReturnedFrom: [mock someMessage2]
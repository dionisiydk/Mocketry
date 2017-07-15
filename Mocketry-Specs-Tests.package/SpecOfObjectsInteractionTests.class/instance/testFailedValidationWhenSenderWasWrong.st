tests
testFailedValidationWhenSenderWasWrong
	
	| spec messages result |
	spec := SpecOfObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector3'
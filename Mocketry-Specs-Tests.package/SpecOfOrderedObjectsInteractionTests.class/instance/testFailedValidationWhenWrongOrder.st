tests
testFailedValidationWhenWrongOrder
	
	| spec messages result |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector2).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver selector: #selector3.
		MockOccurredMessage receiver: #receiver selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver received selector3 in wrong time'
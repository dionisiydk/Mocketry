tests
testSucceedValidation
	
	| spec messages result |
	spec := SpecOfObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: messages.
	
	result should be isSuccess.
	result should beInstanceOf: SpecOfMessagesValidationSuccess.
	result where occurredMessages should equal: {messages first. messages last}
tests
testSucceedValidationOfMultipleSenders
	
	| spec result expectedSenderMessage anotherSenderMessage |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).
	
	expectedSenderMessage := MockOccurredMessage receiver: #receiver selector: #selector.
	expectedSenderMessage result: #object asOccurredMessageResult.
	anotherSenderMessage := MockOccurredMessage receiver: #receiver selector: #anotherSelector.	
	anotherSenderMessage result: #object asOccurredMessageResult.
	
	result := spec validate: { anotherSenderMessage. expectedSenderMessage }.
	
	result should be: SpecOfValidationResult success
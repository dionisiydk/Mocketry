tests
testSucceedValidation
	
	| spec message result |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).

	message := MockOccurredMessage receiver: #receiver selector: #selector.
	message result: #object asOccurredMessageResult.
	
	result := spec validate: { message }.
	
	result should be: SpecOfValidationResult success
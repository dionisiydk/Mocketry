tests
testMatchesMultipleSenders
	
	| spec expectedSenderMessage anotherSenderMessage |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).

	expectedSenderMessage := MockOccurredMessage receiver: #receiver selector: #selector.
	expectedSenderMessage result: #object asOccurredMessageResult.
	anotherSenderMessage := MockOccurredMessage receiver: #receiver selector: #anotherSelector.	
	anotherSenderMessage result: #object asOccurredMessageResult.
	
	spec should be matches: {anotherSenderMessage. expectedSenderMessage}
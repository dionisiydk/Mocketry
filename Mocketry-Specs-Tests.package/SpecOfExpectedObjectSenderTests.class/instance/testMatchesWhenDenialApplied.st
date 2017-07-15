tests
testMatchesWhenDenialApplied
	
	| spec message |
	spec := SpecOfExpectedObjectSender for: #object returnedFrom: (
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)).
	spec denial: true.

	message := MockOccurredMessage receiver: #receiver selector: #selector.	
	message result: #object asOccurredMessageResult.
	
	spec should not be matches: {message}.
	
	message result: #anotherResult asOccurredMessageResult.
	spec should be matches: {message}.
tests
testMatchesWhenExplicitResult

	| spec message |
	spec := SpecOfMessageReturnedValue requiredValue: #returnedValue.	
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	spec should be matches: message.
	
	message result: #anotherValue asOccurredMessageResult.	
	spec should not be matches: message.
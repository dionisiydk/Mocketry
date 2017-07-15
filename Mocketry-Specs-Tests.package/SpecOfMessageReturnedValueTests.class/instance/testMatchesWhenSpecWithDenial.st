tests
testMatchesWhenSpecWithDenial

	| spec message |
	spec := (SpecOfMessageReturnedValue requiredValue: #returnedValue) not.
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	spec should not be matches: message.
	
	message result: #anotherValue asOccurredMessageResult.	
	spec should be matches: message.

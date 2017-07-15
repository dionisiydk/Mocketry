tests
testMatchesWhenSpecWithDenial

	| spec message |
	spec := (SpecOfMessageRaisedException requiredValue: #requiredExc) not.
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	spec should not be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).
	spec should be matches: message
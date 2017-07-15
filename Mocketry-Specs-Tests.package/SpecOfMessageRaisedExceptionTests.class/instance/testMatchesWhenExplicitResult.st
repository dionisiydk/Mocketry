tests
testMatchesWhenExplicitResult

	| spec message |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	spec should be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).
	spec should not be matches: message.
tests
testMatchesWhenRequiredResultSpec

	| spec message |
	spec := SpecOfMessageRaisedException requiredValue: (Kind of: Error).
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: Error new).	
	spec should be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: Notification new).
	spec should not be matches: message.
tests
testSucceedValidation

	| spec message result |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.	
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	result := spec validate: message.
	
	result should be isSuccess
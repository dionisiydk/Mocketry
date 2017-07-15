tests
testDescriptionWhenDenialApplied

	| spec |
	spec := (SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #someMessageWith: argument: #someArg)) not.
	
	spec where description should equal: '#receiver should not receive someMessageWith: #someArg'
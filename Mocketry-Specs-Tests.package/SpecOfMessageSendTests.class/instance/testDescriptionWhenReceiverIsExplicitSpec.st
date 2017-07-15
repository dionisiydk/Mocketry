tests
testDescriptionWhenReceiverIsExplicitSpec

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: (Kind of: Number) selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '(be a kind of Number) should receive someMessageWith: #someArg'
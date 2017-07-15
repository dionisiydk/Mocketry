tests
testDescription

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: #receiver selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg'
tests
testDescriptionWhenAnySelector

	| spec |
	spec := SpecOfMessageSend from: (MessageSend receiver: 10 selector: Any).
	
	spec where description should equal: '10 should receive Any'
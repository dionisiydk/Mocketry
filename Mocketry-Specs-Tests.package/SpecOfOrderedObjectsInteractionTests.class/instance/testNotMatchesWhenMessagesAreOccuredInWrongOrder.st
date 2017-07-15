tests
testNotMatchesWhenMessagesAreOccuredInWrongOrder
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).		
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should not be matches: messages
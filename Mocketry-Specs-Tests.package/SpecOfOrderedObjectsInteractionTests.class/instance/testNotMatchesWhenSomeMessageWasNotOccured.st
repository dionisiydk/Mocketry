tests
testNotMatchesWhenSomeMessageWasNotOccured
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2	}.
	
	spec should not be matches: messages
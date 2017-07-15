tests
testMatchesWhenSomeMessageExpectedTwice
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	spec expectedMessages first usage minCount: 2.
		
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
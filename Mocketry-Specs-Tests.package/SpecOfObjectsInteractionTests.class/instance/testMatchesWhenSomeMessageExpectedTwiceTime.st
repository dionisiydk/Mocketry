tests
testMatchesWhenSomeMessageExpectedTwiceTime
	
	| spec messages |
	spec := SpecOfObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver2 selector: #selector2).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	}.
	spec expectedMessages last usage minCount: 2.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver selector: #selector
	}.
	
	spec should be matches: messages
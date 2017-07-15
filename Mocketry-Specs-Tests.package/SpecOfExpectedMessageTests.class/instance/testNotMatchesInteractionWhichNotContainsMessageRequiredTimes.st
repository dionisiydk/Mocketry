tests
testNotMatchesInteractionWhichNotContainsMessageRequiredTimes

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should not be matches: interaction
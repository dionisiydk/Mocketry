tests
testNotMatchesInteractionWhichNotContainsRequiredMessage

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	
	spec should not be matches: interaction
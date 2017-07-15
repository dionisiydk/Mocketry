tests
testMatchesInteractionWhichContainsRequiredMessage

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should be matches: interaction
tests
testMatchesInteractionWhenDenialApplied

	| spec interaction |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should not be matches: interaction
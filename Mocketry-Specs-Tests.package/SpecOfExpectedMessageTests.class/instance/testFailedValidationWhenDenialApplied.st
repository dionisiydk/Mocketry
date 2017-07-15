tests
testFailedValidationWhenDenialApplied

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver should not receive selector but it was 1 times'
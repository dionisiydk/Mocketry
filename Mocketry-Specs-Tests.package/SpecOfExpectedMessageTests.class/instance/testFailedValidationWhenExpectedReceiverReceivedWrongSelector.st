tests
testFailedValidationWhenExpectedReceiverReceivedWrongSelector

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #wrongSelector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector'.
	result where mostSimilarMessage description should equal: '#receiver received wrongSelector but it should be "#selector"'
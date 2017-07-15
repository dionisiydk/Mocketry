tests
testFailedValidationWhenExpectedReceiverReceivedWrongArgument

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selectorWith: argument: #expectedArg).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selectorWith: argument: #wrongArg).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selectorWith: #expectedArg'.
	result where mostSimilarMessage description should equal: '#receiver received selectorWith: #wrongArg but arg 1 should equal "#expectedArg"'
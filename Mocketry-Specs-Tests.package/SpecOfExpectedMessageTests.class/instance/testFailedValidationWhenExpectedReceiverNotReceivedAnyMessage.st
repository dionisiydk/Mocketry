tests
testFailedValidationWhenExpectedReceiverNotReceivedAnyMessage

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #anotherReceiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector'
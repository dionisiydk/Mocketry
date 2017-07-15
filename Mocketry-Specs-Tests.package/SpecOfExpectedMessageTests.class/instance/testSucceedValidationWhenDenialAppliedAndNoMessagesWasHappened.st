tests
testSucceedValidationWhenDenialAppliedAndNoMessagesWasHappened

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	
	result := spec validate: interaction.		
	
	result should be isSuccess
tests
testSucceedValidationWhenDenialAppliedAndMinUsageCountIsZero

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	spec usage minCount: 0.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #anotherSelector).
	
	result := spec validate: interaction.		
	
	result should be isSuccess
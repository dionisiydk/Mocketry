tests
testSucceedValidation

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isSuccess
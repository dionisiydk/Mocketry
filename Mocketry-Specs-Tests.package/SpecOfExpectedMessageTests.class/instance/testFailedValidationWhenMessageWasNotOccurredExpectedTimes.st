tests
testFailedValidationWhenMessageWasNotOccurredExpectedTimes

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector at least 2 times but it was 1 times'
tests
testMockFromMessageShouldSimulateFalseInIfTrueExpression
	| returnedMock result ifTrueExecuted |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifTrue: [ ifTrueExecuted := true ].
	
	result should be: nil.
	ifTrueExecuted should not be: true
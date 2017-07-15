tests
testMockFromMessageShouldSimulateFalseInIfFalseIfTrueExpression
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #falseBranch ] ifTrue: [ #trueBranch ].
	
	result should be: #falseBranch.
	returnedMock should be: false
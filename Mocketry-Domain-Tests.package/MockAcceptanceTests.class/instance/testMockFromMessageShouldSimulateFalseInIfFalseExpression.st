tests
testMockFromMessageShouldSimulateFalseInIfFalseExpression
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #ifFalseBranch ].
	
	result should be: #ifFalseBranch
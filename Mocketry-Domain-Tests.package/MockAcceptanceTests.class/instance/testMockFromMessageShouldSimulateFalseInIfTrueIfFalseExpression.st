tests
testMockFromMessageShouldSimulateFalseInIfTrueIfFalseExpression
	| returnedMock result |	
	returnedMock := mock someMessage. 
	  
	result := returnedMock ifTrue: [ #trueBranch ] ifFalse: [ #falseBranch ].

	result should be: #falseBranch.
	returnedMock should be: false
tests
testExtractingRaisedExceptionResultWhenHaltRaised

	| message error |
	message := MockOccurredMessage new.
	error := Error new.
	
	[message extractResultFrom: [ self halt ]] should raise: Halt.

	message where result should be: nil
tests
testExtractingRaisedExceptionResultFromBlock

	| message error |
	message := MockOccurredMessage new.
	error := Error new.
	[message extractResultFrom: [ error signal ]] should raise: error.
	
	message where result should beInstanceOf: MockOccurredExceptionSignal.
	message where result exception should be: error
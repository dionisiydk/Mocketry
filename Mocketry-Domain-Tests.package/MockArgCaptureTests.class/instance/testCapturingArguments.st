tests
testCapturingArguments

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	arg captureValue: #argValue.
	arg captureValue: #argValue.
	arg captureValue: #argValue3.
	
	arg values should equal: #(argValue argValue argValue3)
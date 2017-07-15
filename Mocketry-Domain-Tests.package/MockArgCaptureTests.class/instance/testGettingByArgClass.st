tests
testGettingByArgClass

	| arg storedArg |
	arg := Arg argName.
	
	(arg class = MockArgCapture) should be: true. "should is overriden by MockArgCapture to verify captured values".
	arg name should be: #argName.
	
	(arg == Arg argName) should be: true.
	storedArg := MockCurrentBehaviour value argCaptureNamed: #argName.
	(arg == storedArg) should be: true
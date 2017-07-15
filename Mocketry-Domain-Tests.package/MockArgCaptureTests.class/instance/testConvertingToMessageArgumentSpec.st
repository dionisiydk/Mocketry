tests
testConvertingToMessageArgumentSpec

	| arg spec |
	arg := MockArgCapture named: 'testArg'.
	
	spec := arg asSpecOfArg: 2 of: #messageSendSpec.
	
	spec should beInstanceOf: SpecOfMessageArgument.
	spec where argumentNumber should be: 2.
	(spec requiredValue == arg) should be: true.
	arg messageSpec should be: #messageSendSpec
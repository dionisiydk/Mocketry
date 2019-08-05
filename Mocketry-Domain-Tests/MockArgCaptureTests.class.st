Class {
	#name : #MockArgCaptureTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #helpers }
MockArgCaptureTests >> prepareCapture [
	| arg message |
	
	message := MockOccurredMessage receiver: #receiver selector: #asString.
	4 timesRepeat: [MockCurrentBehaviour value replayMessageSend: message].
	
	arg := MockArgCapture named: 'testArg'.
	arg messageSpec: (SpecOfMessageSend from: message).
	^arg
]

{ #category : #tests }
MockArgCaptureTests >> testApplyingShouldWhenNoMessageSpecDefined [

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	[arg should] should fail
]

{ #category : #tests }
MockArgCaptureTests >> testApplyingWhereExpression [

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3}.
	
	arg where x should be: 2
]

{ #category : #tests }
MockArgCaptureTests >> testCapturingArguments [

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	arg captureValue: #argValue.
	arg captureValue: #argValue.
	arg captureValue: #argValue3.
	
	arg values should equal: #(argValue argValue argValue3)
]

{ #category : #tests }
MockArgCaptureTests >> testConvertingToMessageArgumentSpec [

	| arg spec |
	arg := MockArgCapture named: 'testArg'.
	
	spec := arg asSpecOfArg: 2 of: #messageSendSpec.
	
	spec should beInstanceOf: SpecOfMessageArgument.
	spec where argumentNumber should be: 2.
	(spec requiredValue == arg) should be: true.
	arg messageSpec should be: #messageSendSpec
]

{ #category : #tests }
MockArgCaptureTests >> testDelegatingMessagesToFirstValue [

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3}.
	
	arg x should be: 2
]

{ #category : #tests }
MockArgCaptureTests >> testDelegatingMessagesToFirstValueWhenThereAreMultipleValues [

	| arg |
	
	arg := self prepareCapture.
	
	arg values: {2@3. 10@20}.
	
	[arg x] should fail
]

{ #category : #tests }
MockArgCaptureTests >> testFromAllCall [

	| arg shouldReceiver |
	
	arg := self prepareCapture.
	
	shouldReceiver := arg fromAllCalls.
	shouldReceiver class should beInstanceOf: MockAllValuesArgReceiver.
	self assert: shouldReceiver argCapture == arg
]

{ #category : #tests }
MockArgCaptureTests >> testFromConcreteCall [

	| arg shouldReceiver |
	
	arg := self prepareCapture.
	
	shouldReceiver := arg fromCall: 2.
	shouldReceiver class should beInstanceOf: MockConcreteCallArgReceiver.
	shouldReceiver callNumber should equal: 2.
	self assert: shouldReceiver argCapture == arg
]

{ #category : #tests }
MockArgCaptureTests >> testFromFirstCall [

	| arg shouldReceiver |
	
	arg := self prepareCapture.
	
	shouldReceiver := arg fromFirstCall.
	shouldReceiver class should beInstanceOf: MockConcreteCallArgReceiver.
	shouldReceiver callNumber should equal: 1.
	self assert: shouldReceiver argCapture == arg
]

{ #category : #tests }
MockArgCaptureTests >> testFromLastCall [

	| arg shouldReceiver |
	
	arg := self prepareCapture.
	
	shouldReceiver := arg fromLastCall.
	shouldReceiver class should beInstanceOf: MockLastCallArgReceiver.
	self assert: shouldReceiver argCapture == arg
]

{ #category : #tests }
MockArgCaptureTests >> testGettingByArgClass [

	| arg storedArg |
	arg := Arg argName.
	
	(arg class = MockArgCapture) should be: true. "should is overriden by MockArgCapture to verify captured values".
	arg name should be: #argName.
	
	(arg == Arg argName) should be: true.
	storedArg := MockCurrentBehaviour value argCaptureNamed: #argName.
	(arg == storedArg) should be: true
]

{ #category : #tests }
MockArgCaptureTests >> testGettingValueFromGivenCall [

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #(1 2 3).
	
	(arg valueFromCall: 2) should be: 2
]

{ #category : #tests }
MockArgCaptureTests >> testGettingValueFromLastCall [

	| arg |
	
	arg := self prepareCapture.
	
	arg values: #(1 2 3).
	
	arg valueFromLastCall should be: 3
]

{ #category : #tests }
MockArgCaptureTests >> testMatchesToAnyObject [

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	(arg basicMatches: Any) should be: true
]

{ #category : #tests }
MockArgCaptureTests >> testValidatesAnyObject [

	| arg |
	arg := MockArgCapture named: 'testArg'.
	
	(arg validate: Any) should be: SpecOfValidationResult success
]

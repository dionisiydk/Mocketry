"
I am a special kind of should expression receiver representing captured value from last message send.
I am used to implement following should expression: 

	Arg argName fromLastCall should equal: 10.

I ensure that at least one message was actually sent (at least one value was captured) and in case if it is not true it will be the result of validation.
"
Class {
	#name : #MockLastCapturedValueReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #printing }
MockLastCapturedValueReceiver >> printProperty: aShouldReceiverProperty [
	^self argCapture stringForSpecTitle, ' ', aShouldReceiverProperty printPath,
		' from last call'
]

{ #category : #printing }
MockLastCapturedValueReceiver >> stringForSpecTitle [

	^super stringForSpecTitle, ' from last call'
]

{ #category : #validation }
MockLastCapturedValueReceiver >> validate [
	
	^self argCapture validateNumberOfCalls: 1
]

{ #category : #accessing }
MockLastCapturedValueReceiver >> validationSubject [
	
	^self argCapture valueFromLastCall
]

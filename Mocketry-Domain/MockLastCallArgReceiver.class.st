"
I am a special kind of should expression receiver representing captured value from last message send.
I am used to implement following should expression: 

	Arg argName fromLastCall should equal: 10.

I ensure that at least one message was actually sent (at least one value was captured) and in case if it is not true it will be the result of validation.
"
Class {
	#name : #MockLastCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #printing }
MockLastCallArgReceiver >> printProperty: aShouldExpressionReceiverProperty [
	^argCapture stringForSpecTitle, ' ', aShouldExpressionReceiverProperty printPath,
		' from last call'
]

{ #category : #printing }
MockLastCallArgReceiver >> stringForSpecTitle [

	^super stringForSpecTitle, ' from last call'
]

{ #category : #validation }
MockLastCallArgReceiver >> validate [
	
	^argCapture validateNumberOfCalls: 1
]

{ #category : #accessing }
MockLastCallArgReceiver >> validationSubject [
	
	^argCapture valueFromLastCall
]

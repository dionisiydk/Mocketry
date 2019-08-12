"
I am a special kind of should expression receiver representing captured value from concrete message send.
I am used to implement following should expression: 

	(Arg argName fromCall: 2) should equal: 10.

I ensure that given number of messages was actually sent (given number of values were captured) and in case if it is not true it will be the result of validation.

My instances can be created using following method:

	MockConcreteCallArgReceiver from: Arg argName callNumber: 2.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	callNumber:		<Integer>
"
Class {
	#name : #MockConcreteCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#instVars : [
		'callNumber'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockConcreteCallArgReceiver class >> from: aMockArgCapture callNumber: aNumber [

	^(self from: aMockArgCapture) 
		callNumber: aNumber
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> callNumber [
	^ callNumber
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> callNumber: anObject [
	callNumber := anObject
]

{ #category : #printing }
MockConcreteCallArgReceiver >> printProperty: aShouldExpressionReceiverProperty [
	^argCapture stringForSpecTitle, ' ', aShouldExpressionReceiverProperty printPath,
		' from ' , callNumber asString, ' call'
]

{ #category : #printing }
MockConcreteCallArgReceiver >> stringForSpecTitle [

	^super stringForSpecTitle, ' from ', callNumber asString, ' call'
]

{ #category : #validation }
MockConcreteCallArgReceiver >> validate [
	
	^argCapture validateNumberOfCalls: callNumber
]

{ #category : #accessing }
MockConcreteCallArgReceiver >> validationSubject [
	
	^argCapture valueFromCall: callNumber
]

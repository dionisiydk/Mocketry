"
I am a special kind of should expression receiver representing captured value from concrete message send.
I am used to implement following should expression: 

	(Arg argName fromCall: 2) should equal: 10.

I ensure that given number of messages was actually sent (given number of values were captured) and in case if it is not true it will be the result of validation.

My instances can be created using following method:

	MockConcreteCapturedValueReceiver from: Arg argName callNumber: 2.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	callNumber:		<Integer>
"
Class {
	#name : #MockConcreteCapturedValueReceiver,
	#superclass : #MockCapturedArgReceiver,
	#instVars : [
		'callNumber'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockConcreteCapturedValueReceiver class >> from: aMockArgCapture callNumber: aNumber [

	^(self from: aMockArgCapture) 
		callNumber: aNumber
]

{ #category : #accessing }
MockConcreteCapturedValueReceiver >> callNumber [
	^ callNumber
]

{ #category : #accessing }
MockConcreteCapturedValueReceiver >> callNumber: anObject [
	callNumber := anObject
]

{ #category : #printing }
MockConcreteCapturedValueReceiver >> printProperty: aShouldReceiverProperty [
	^self argCapture stringForSpecTitle, ' ', aShouldReceiverProperty printPath,
		' from ' , callNumber asString, ' call'
]

{ #category : #printing }
MockConcreteCapturedValueReceiver >> stringForSpecTitle [

	^super stringForSpecTitle, ' from ', callNumber asString, ' call'
]

{ #category : #validation }
MockConcreteCapturedValueReceiver >> validate [
	
	^self argCapture validateNumberOfCalls: callNumber
]

{ #category : #accessing }
MockConcreteCapturedValueReceiver >> validationSubject [
	
	^self argCapture valueFromCall: callNumber
]

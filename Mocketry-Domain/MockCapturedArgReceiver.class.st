Class {
	#name : #MockCapturedArgReceiver,
	#superclass : #SpecOfShouldExpressionReceiver,
	#instVars : [
		'argCapture'
	],
	#category : #'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockCapturedArgReceiver class >> from: aMockArgCapture [

	^self new 
		argCapture: aMockArgCapture
]

{ #category : #testing }
MockCapturedArgReceiver class >> isAbstract [ 	
	^self = MockCapturedArgReceiver 
]

{ #category : #accessing }
MockCapturedArgReceiver >> argCapture [
	^ argCapture
]

{ #category : #accessing }
MockCapturedArgReceiver >> argCapture: anObject [
	argCapture := anObject
]

{ #category : #printing }
MockCapturedArgReceiver >> printSubject: anObject [

	^(super printSubject: anObject) , ' from ', self stringForSpecTitle
]

{ #category : #printing }
MockCapturedArgReceiver >> stringForSpecTitle [

	^argCapture stringForSpecTitle
]

{ #category : #accessing }
MockCapturedArgReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionReceiverProperty of: self message: aMessage
]

{ #category : #validation }
MockCapturedArgReceiver >> validate [
	self subclassResponsibility 
]

{ #category : #validation }
MockCapturedArgReceiver >> validate: aSpecOfObjectState [

	| result |
	result := self validate.
	result isSuccess ifFalse: [ ^result ].
	
	^super validate: aSpecOfObjectState 
]

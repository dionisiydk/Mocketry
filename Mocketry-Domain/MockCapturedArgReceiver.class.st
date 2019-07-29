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

	^(super printSubject: anObject) , ' from ', self stringForSpecValidation
]

{ #category : #printing }
MockCapturedArgReceiver >> stringForSpecTitle [

	^argCapture stringForSpecTitle
]

{ #category : #accessing }
MockCapturedArgReceiver >> subPropertyAt: aMessage [

	^SpecOfShouldExpressionPropertyReceiver of: self message: aMessage
]

{ #category : #accessing }
MockCapturedArgReceiver >> valueForFutureStateValidation [ 
	^self validationSubject
]

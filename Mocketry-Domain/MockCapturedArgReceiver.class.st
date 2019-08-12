"
My subclasses represent captured agrument values from the message sends (mock object call) in should expressions.

For simplest cases there is MockSingleCallArgReceiver which allows to validate the argument of single message send: 

	Arg argName should equal: 10

Subclasses decide what captured value needs to be validated and according to that they specialize the printing of validation result.
	
Instances are created with argument capture:

	MockSingleCallArgReceiver from: Arg argName
	 
Internal Representation and Key Implementation Points.

    Instance Variables
	argCapture:		<MockArgCapture>
			
"
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

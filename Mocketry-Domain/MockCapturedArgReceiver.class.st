"
My subclasses represent captured agrument values from the message sends (mock object call) in should expressions.

For simplest cases there is MockSingleCapturedValueReceiver which allows to validate the argument of single message send: 

	Arg argName should equal: 10

Subclasses decide what captured value needs to be validated and according to that they specialize the printing of validation result.
	
Instances are created with argument capture:

	MockSingleCapturedValueReceiver from: Arg argName
	 
Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<MockArgCapture>
			
"
Class {
	#name : #MockCapturedArgReceiver,
	#superclass : #SpecOfShouldReceiverRoot,
	#category : #'Mocketry-Domain'
}

{ #category : #testing }
MockCapturedArgReceiver class >> isAbstract [ 	
	^self = MockCapturedArgReceiver 
]

{ #category : #accessing }
MockCapturedArgReceiver >> argCapture [
	^ value
]

{ #category : #converting }
MockCapturedArgReceiver >> asFutureStateShouldReceiver [
	^self 
]

{ #category : #validation }
MockCapturedArgReceiver >> createSpecOfValidationSubject [
	^SpecOfObjectHolder requiredHolder: self
]

{ #category : #printing }
MockCapturedArgReceiver >> printSubject: anObject [

	^(super printSubject: anObject) , ' from ', self stringForSpecTitle
]

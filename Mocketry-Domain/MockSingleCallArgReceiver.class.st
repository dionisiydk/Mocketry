"
I am a special kind of should expression receiver representing captured value from single message send.
I am used to implement simplest form of should expression with capture: 

	Arg argName should equal: 10.

I ensure that there was only message send. If there was no messages it will be the validation result. But if there were more than one message it will be general error considering that it is programmer error because it is his responsibility to choose explicitly the captured value for validation.
"
Class {
	#name : #MockSingleCallArgReceiver,
	#superclass : #MockCapturedArgReceiver,
	#category : #'Mocketry-Domain'
}

{ #category : #validation }
MockSingleCallArgReceiver >> validate [
	^argCapture validateSingleValue
]

{ #category : #accessing }
MockSingleCallArgReceiver >> validationSubject [
	
	^argCapture valueFromCall: 1
]

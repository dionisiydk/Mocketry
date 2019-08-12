"
I represent expected message result which will execute original method of stubbed real object but in addition I will stub the result.
So the result of my execution will be also stubbed and will record all message sends
"
Class {
	#name : #MockExpectedMethodResultStub,
	#superclass : #MockExpectedOriginalMethodCall,
	#category : #'Mocketry-Domain'
}

{ #category : #evaluating }
MockExpectedMethodResultStub >> executeFor: anOccurredMessage [
	| realMethodResult |
	realMethodResult := super executeFor: anOccurredMessage.
	realMethodResult stub.
	^realMethodResult
]
